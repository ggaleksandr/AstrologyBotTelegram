import asyncio
import logging

import msgpack
import nats
from aiogram import Bot
from aiogram.exceptions import (TelegramBadRequest, TelegramForbiddenError,
                                TelegramRetryAfter)
from aiogram.types import BufferedInputFile
from nats.errors import TimeoutError
from sqlalchemy.ext.asyncio import AsyncSession

from bot.configreader import config
from bot.db.requests import log_file_id
from bot.logic.enums import HoroscopeTypeEnums, SignEnums
from bot.tasks.draw_horoscope_images import draw_image

logger = logging.getLogger(__name__)


async def sent_and_get_file_ids_writer(
        bot: Bot,
        session: AsyncSession
):
    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    for sign in SignEnums:
        for horoscope_type in HoroscopeTypeEnums:
            sign_name_eng = sign.name
            horoscope_type_name_eng = horoscope_type.name

            image = BufferedInputFile(file=await draw_image(sign_name_eng, horoscope_type_name_eng, session),
                                      filename=sign_name_eng + horoscope_type_name_eng)

            await asyncio.sleep(float(0.4))

            message = await bot.send_photo(chat_id=config.admin_id, photo=image)

            logger.info(
                f'Sent image for {sign_name_eng} {horoscope_type_name_eng} with file_id = {message.photo[-1].file_id}')

            msg = {
                "sign_value": sign.value,
                "horoscope_type_value": horoscope_type.value,
                "file_id": message.photo[-1].file_id,
                "message_id": message.message_id
            }

            await js.publish(subject="send.file_ids", payload=msgpack.packb(msg))

    await nc.close()


async def sent_and_get_file_ids_listener(
    bot: Bot,
    session: AsyncSession
):
    batch_size = 5
    nc = await nats.connect(config.nats_dsn)
    js = nc.jetstream()

    psub = await js.pull_subscribe(subject="send.file_ids.>", durable="NATS_consumer_save_ids")

    if not psub:
        raise ValueError("No consumer subscription")

    while True:
        try:
            msgs = await psub.fetch(batch_size)
            for msg in msgs:
                try:
                    msg_data = msgpack.unpackb(msg.data)
                    try:
                        sign_value = msg_data['sign_value']
                        horoscope_type_value = msg_data['horoscope_type_value']
                        file_id = msg_data['file_id']

                        await log_file_id(session, sign_value, horoscope_type_value, file_id)

                        logger.info(f'Saved image for {sign_value} {horoscope_type_value} with file_id = {file_id}')

                    except TelegramBadRequest as e:
                        logger.warning(e)
                        pass

                except TelegramForbiddenError:
                    pass
                await msg.ack()

        except TimeoutError:
            break

        except TelegramRetryAfter as e:
            await asyncio.sleep(float(e.retry_after))
            continue

    await nc.close()
    await bot.send_message(chat_id=config.admin_id, text="Получение file_ids завершено!")
