import logging
from typing import Any

from aiogram.fsm.context import FSMContext
from aiogram.methods.send_message import SendMessage
from aiogram.methods.send_photo import SendPhoto
from aiogram.types import BufferedInputFile
from aiogram.utils.markdown import hlink
from sqlalchemy.ext.asyncio import AsyncSession

from bot.keyboards.kb_return import return_to_start_menu_kb
from bot.keyboards.kb_save_to_db_suggestion import \
    return_to_start_menu_or_save_data_kb
from bot.logic.async_wrapper import async_wrapper
from bot.tasks.create_image_with_data import draw_image
from bot.tasks.generate_telegraph_page import generate_telegraph_page

logger = logging.getLogger(__name__)


@async_wrapper
def create_natal_image(
        user_input_data: dict[str, Any],
        file_paths: dict[str, Any]
):

    natal_output_image, aspects_list, houses_list, user_instance_json = draw_image(user_input_data, file_paths)

    return natal_output_image, aspects_list, houses_list, user_instance_json


async def generate_natal_summary(
    chat_id: int,
    show_save_to_db_button: bool,
    state: FSMContext,
    file_paths: dict[str, Any],
    session: AsyncSession
) -> None:

    fsm_data = await state.get_data()

    natal_hour_of_birth, natal_minute_of_birth = fsm_data["time_of_birth"].split(":")

    user_input_data = {
        "user_name": str(fsm_data["username"]),
        "user_year": int(fsm_data["year_of_birth"]),
        "user_month": int(fsm_data["month_of_birth"]),
        "user_day": int(fsm_data["day_of_birth"]),
        "user_hour": int(natal_hour_of_birth),
        "user_minute": int(natal_minute_of_birth),
        "user_city": str(fsm_data["place_of_birth"])
    }

    logger.info(f'User input data: {user_input_data}')

    result_natal_image, aspects_list, houses_list, user_instance_json = await create_natal_image(user_input_data, file_paths)

    image = BufferedInputFile(
        result_natal_image, filename="natal_output_image")

    if show_save_to_db_button:
        reply_markup = return_to_start_menu_or_save_data_kb()
        message_text = "Ваша натальная карта!\n" \
                       "Вы можете сохранить данные о себе для того, чтобы не вводить их в дальнейшем."
    else:
        reply_markup = return_to_start_menu_kb()
        message_text = "Ваша натальная карта!"

    message = await SendPhoto(chat_id=chat_id, photo=image, caption=message_text, reply_markup=reply_markup)

    await state.update_data(photo_file_id=message.photo[-1].file_id)

    unique_url = await generate_telegraph_page(user_instance_json, session, aspects_list, houses_list)
    formatted_link = hlink(title="тут", url=unique_url)

    await SendMessage(chat_id=chat_id,
                      text=f'Вы можете узнать, что значит Ваша натальная карта <b>{formatted_link}</b>.')

    await state.update_data(telegraph_link=unique_url)
