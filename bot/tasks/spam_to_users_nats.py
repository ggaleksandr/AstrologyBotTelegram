import asyncio
from datetime import datetime
from typing import Any

import msgpack
import nats
from aiogram import Bot
from aiogram.exceptions import TelegramRetryAfter, TelegramForbiddenError
from nats.errors import TimeoutError
from sqlalchemy.ext.asyncio import AsyncSession

from bot.configreader import config
from bot.db.models import UserBase
from bot.db.requests import get_all_users
from bot.functions.build_kb_from_buttons import build_kb_from_buttons


async def spam_writer(
        spam_message: dict[str, Any],
        session: AsyncSession
):
    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    msg = {
        "text": spam_message["text"],
        "photo": spam_message["photo"],
        "video": spam_message["video"],
        "animation": spam_message["animation"],
        "inline_buttons": spam_message["inline_buttons"],
        "sched_time": spam_message["sched_time"],
        "kb_parameters_string": spam_message["kb_parameters_string"],
    }

    users = await get_all_users(session)
    user: UserBase

    for user in users:
        msg['telegram_id'] = user.telegram_id
        await js.publish(subject="send.spam", payload=msgpack.packb(msg))

    await nc.close()


async def spam_listener(
        bot: Bot,
        batch_size: int = 5
):
    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    psub = await js.pull_subscribe(subject="send.spam.>", durable="NATS_consumer_send_spam")

    if not psub:
        raise ValueError("No consumer subscription")

    while True:
        try:
            msgs = await psub.fetch(batch_size)
            data = msgpack.unpackb(msgs[0].data)

            inline_buttons = data['inline_buttons']
            kb_parameters_string = data['kb_parameters_string']

            kb_parameters = [int(x) for x in kb_parameters_string.split(',')]
            reply_markup = build_kb_from_buttons(inline_buttons, kb_parameters)

            for msg in msgs:
                data = msgpack.unpackb(msg.data)
                sched_time = datetime.strptime(data['sched_time'], '%Y-%m-%d %H:%M')
                current_time = datetime.now()
                time_delta = (sched_time - current_time).total_seconds()

                if time_delta < 0:
                    try:
                        if data['photo'] is not None:
                            await bot.send_photo(chat_id=data['telegram_id'], photo=data['photo'],
                                                 caption=data['text'], reply_markup=reply_markup)
                        elif data['video'] is not None:
                            await bot.send_video(chat_id=data['telegram_id'], video=data['video'],
                                                 caption=data['text'], reply_markup=reply_markup)
                        elif data['animation'] is not None:
                            await bot.send_animation(chat_id=data['telegram_id'], animation=data['animation'],
                                                     caption=data['text'], reply_markup=reply_markup)
                        else:
                            await bot.send_message(chat_id=data['telegram_id'], text=data['text'],
                                                   reply_markup=reply_markup)
                        await msg.ack()

                    except TelegramForbiddenError:
                        pass
                else:
                    await msg.nak(time_delta)

        except TimeoutError:
            break

        except TelegramRetryAfter as e:
            await asyncio.sleep(float(e.retry_after))
            continue

    await nc.close()
