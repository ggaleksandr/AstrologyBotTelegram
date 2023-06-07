import asyncio

import msgpack
import nats
from aiogram import Bot
from aiogram.exceptions import (TelegramBadRequest, TelegramForbiddenError,
                                TelegramRetryAfter)
from nats.errors import TimeoutError
from sqlalchemy.ext.asyncio import AsyncSession

from bot.configreader import config
from bot.db.requests import get_all_subscriptions, get_file_id
from bot.logic.enums import HoroscopeTypeEnums, SignEnums
from bot.tasks.read_config import image_param_horoscope


async def subs_writer(
    session: AsyncSession
):
    subscriptions = await get_all_subscriptions(session)

    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    for subscription in subscriptions:
        file_info = await get_file_id(session, subscription["UserSign"].fk_sign,
                                      subscription["UserSign"].fk_horoscope_type)

        msg = {
            "telegram_id": subscription["UserSign"].telegram_id,
            "fk_sign": subscription["UserSign"].fk_sign,
            "fk_horoscope_type": subscription["UserSign"].fk_horoscope_type,
            "file_id": file_info.file_id
        }

        await js.publish(subject="send.horoscopes", payload=msgpack.packb(msg))

    await nc.close()


async def subs_listener(
    bot: Bot
):
    batch_size = 5
    # polling_timeout = 10
    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    psub = await js.pull_subscribe(subject="send.horoscopes.>", durable="NATS_consumer_send_horoscopes")

    if not psub:
        raise ValueError("No consumer subscription")

    while True:
        try:
            msgs = await psub.fetch(batch_size)

            for msg in msgs:
                try:
                    data = msgpack.unpackb(msg.data)

                    sign_name_eng = SignEnums(data['fk_sign']).name
                    horoscope_type_name_eng = HoroscopeTypeEnums(data['fk_horoscope_type']).name

                    horoscope_type_name_rus_genitive = image_param_horoscope["horoscope_type_names_rus"][
                        horoscope_type_name_eng]["horoscope_type_name_rus_genitive"]
                    sign_name_rus_genitive = image_param_horoscope[
                        "sign_names"][sign_name_eng]["sign_name_rus_genitive"]
                    try:
                        await asyncio.sleep(0.45)
                        message_text = f'Вы получили это сообщение, потому что подписаны на ежедневную рассылку ' \
                                       f'{horoscope_type_name_rus_genitive} гороскопов ' \
                                       f'для {sign_name_rus_genitive}.\n' \
                                       f'Вы можете отписаться от рассылки, нажав /unsub.'
                        await bot.send_photo(chat_id=data['telegram_id'], photo=data['file_id'], caption=message_text)

                    except TelegramBadRequest as e:
                        print("Error:", e)
                        pass

                except TelegramForbiddenError:
                    pass
                await msg.ack()

        except TimeoutError:
            await bot.send_message(chat_id=config.admin_id, text="Рассылка закончена")
            break

        except TelegramRetryAfter as e:
            await asyncio.sleep(float(e.retry_after))
            continue

    await nc.close()
