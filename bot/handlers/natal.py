import logging
from datetime import datetime

from aiogram import Router, types
from aiogram.fsm.context import FSMContext
from aiogram.methods.edit_message_reply_markup import EditMessageReplyMarkup
from aiogram.methods.send_message import SendMessage
from aiogram.methods.send_photo import SendPhoto
from aiogram.types import Message
from aiogram.utils.chat_action import ChatActionSender
from aiogram.utils.markdown import hlink
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.requests import (get_user_info_by_id,
                             get_user_info_existance_by_id, log_user_info)
from bot.functions.check_city_validity import check_city_validity
from bot.functions.check_time_validity import check_time_validity
from bot.keyboards.kb_all_signs import (NatalMenuCallbackFactory,
                                        all_signs_inline_kb)
from bot.keyboards.kb_calendar import CalendarCallback, DialogCalendar
from bot.keyboards.kb_city_verify import verify_city_or_return
from bot.keyboards.kb_load_from_db_suggestion import \
    return_to_start_menu_or_load_data_kb
from bot.keyboards.kb_return import return_to_start_menu_kb
from bot.logic.cbdata import (LoadDataFromDBCallbackFactory,
                              SaveDataToDBCallbackFactory,
                              VerifyCityInlineButtonCallbackFactory)
from bot.logic.states import NatalState
from bot.tasks.generate_natal_summary import generate_natal_summary
from bot.tasks.read_config import file_paths

logger = logging.getLogger(__name__)

dialogcalendar = DialogCalendar()

router = Router()


@router.callback_query(NatalMenuCallbackFactory.filter(), flags={"throttling_key": "text"})
async def callbacks_natal_menu(
        callback: types.CallbackQuery,
        state: FSMContext,
        session: AsyncSession,
):
    await state.set_state(NatalState.natal_username)

    is_user_info_exist = await get_user_info_existance_by_id(session, callback.from_user.id)

    if is_user_info_exist:
        reply_markup = return_to_start_menu_or_load_data_kb()
    else:
        reply_markup = return_to_start_menu_kb()

    await SendMessage(chat_id=callback.from_user.id,
                      reply_markup=reply_markup,
                      text="Для составления натальной карты нужны некоторые данные. \nКак Вас зовут?")

    await callback.answer()


@router.callback_query(LoadDataFromDBCallbackFactory.filter(), flags={"throttling_key": "text"})
async def callbacks_load_user_info(
        callback: types.CallbackQuery,
        state: FSMContext,
        session: AsyncSession,
):
    user_info = await get_user_info_by_id(session, callback.from_user.id)

    user_info.time_of_birth = user_info.datetime_of_birth.strftime("%H:%M")
    user_info.year_of_birth = user_info.datetime_of_birth.strftime("%Y")
    user_info.month_of_birth = user_info.datetime_of_birth.strftime("%m")
    user_info.day_of_birth = user_info.datetime_of_birth.strftime("%d")

    await state.update_data(username=user_info.username)
    await state.update_data(year_of_birth=user_info.year_of_birth)
    await state.update_data(month_of_birth=user_info.month_of_birth)
    await state.update_data(day_of_birth=user_info.day_of_birth)
    await state.update_data(time_of_birth=user_info.time_of_birth)
    await state.update_data(place_of_birth=user_info.place_of_birth)
    await state.update_data(telegraph_link=user_info.telegraph_link)

    file_id = user_info.photo_file_id

    if file_id is None:
        message_text = f'Натальная карта генерируется, пожалуйста, подождите.'
        await SendMessage(chat_id=callback.message.chat.id, text=message_text)
        await generate_natal_summary(chat_id=callback.message.chat.id,
                                     show_save_to_db_button=True, state=state,
                                     file_paths=file_paths, session=session)

    else:
        message_text = "Ваша натальная карта!"
        await SendPhoto(chat_id=callback.from_user.id, photo=file_id, caption=message_text)
        formated_link = hlink(title="тут", url=user_info.telegraph_link)
        await SendMessage(chat_id=callback.from_user.id,
                          text=f'Вы можете узнать, что значит Ваша натальная карта <b>{formated_link}</b>.')

    await callback.answer()


@router.message(NatalState.natal_username, flags={"throttling_key": "text"})
async def natal_username(
        message: Message,
        state: FSMContext
) -> None:
    await state.update_data(username=message.text)

    await SendMessage(chat_id=message.chat.id,
                      reply_markup=return_to_start_menu_kb(),
                      text=f'Ваше имя: {message.text} \nВ каком городе Вы родились?')

    await state.set_state(NatalState.natal_place_of_birth)


@router.message(NatalState.natal_place_of_birth, flags={"throttling_key": "request"})
async def natal_place_of_birth(
        message: Message,
        state: FSMContext
) -> None:
    place_of_birth = message.text

    is_valid, city_name = check_city_validity(place_of_birth)

    await state.update_data(place_of_birth=city_name)

    if not is_valid:
        message_text = "Найти Ваш город не получилось. \n" \
                       "Пожалуйста, проверьте правильность ввода" \
                       " или попробуйте указать ближайший к Вам город вместо введенного."
        await SendMessage(chat_id=message.chat.id, text=message_text)
        await state.set_state(NatalState.natal_place_of_birth)

    else:
        await SendMessage(chat_id=message.chat.id,
                          reply_markup=verify_city_or_return(),
                          text=f'Вы имели в виду {city_name}?')
        await state.set_state(NatalState.natal_place_of_birth)


@router.callback_query(VerifyCityInlineButtonCallbackFactory.filter(), NatalState.natal_place_of_birth,
                       flags={"throttling_key": "text"})
async def natal_place_of_birth(
        callback: types.CallbackQuery,
        callback_data: CalendarCallback,
        state: FSMContext,
):
    fsm_data = await state.get_data()

    city_name = fsm_data["place_of_birth"]

    if callback_data.action == "Verify":
        await state.update_data(place_of_birth=city_name)
        message_text = f'Место Вашего рождения: {city_name} \n' \
                       f'В какой день Вы родились? \n' \
                       f'Вы можете ввести дату в формате ДД.ММ.ГГГГ, либо выбрать ее в календаре.'
        await SendMessage(chat_id=callback.from_user.id, text=message_text,
                          reply_markup=await dialogcalendar.start_calendar())
        await state.set_state(NatalState.natal_date_of_birth)

    elif callback_data.action == "Return":
        await SendMessage(chat_id=callback.from_user.id, text=f'В каком городе Вы родились?')
        await state.set_state(NatalState.natal_place_of_birth)

    await callback.answer()


@router.callback_query(CalendarCallback.filter(), NatalState.natal_date_of_birth, flags={"throttling_key": "calendar"})
async def calendar(
        callback: types.CallbackQuery,
        callback_data: CalendarCallback,
        state: FSMContext,
):
    if callback_data.action == "IGNORE":
        await callback.answer(cache_time=60)

    if callback_data.action == "SET-YEAR":
        await EditMessageReplyMarkup(message_id=callback.message.message_id, chat_id=callback.from_user.id,
                                     reply_markup=await dialogcalendar._get_month_kb(int(callback_data.year)))

    if callback_data.action == "PREV-YEARS":
        new_year = int(callback_data.year) - 5
        await EditMessageReplyMarkup(message_id=callback.message.message_id, chat_id=callback.from_user.id,
                                     reply_markup=await dialogcalendar.start_calendar(new_year))

    if callback_data.action == "NEXT-YEARS":
        new_year = int(callback_data.year) + 5
        await EditMessageReplyMarkup(message_id=callback.message.message_id, chat_id=callback.from_user.id,
                                     reply_markup=await dialogcalendar.start_calendar(new_year))

    if callback_data.action == "START":
        await EditMessageReplyMarkup(message_id=callback.message.message_id, chat_id=callback.from_user.id,
                                     reply_markup=await dialogcalendar.start_calendar(int(callback_data.year)))

    if callback_data.action == "SET-MONTH":
        await EditMessageReplyMarkup(message_id=callback.message.message_id, chat_id=callback.from_user.id,
                                     reply_markup=await dialogcalendar._get_days_kb(int(callback_data.year),
                                                                                    int(callback_data.month)))

    if callback_data.action == "SET-DAY":
        await callback.message.delete_reply_markup()

        await state.update_data(year_of_birth=str(callback_data.year).zfill(4))
        await state.update_data(month_of_birth=str(callback_data.month + 1).zfill(2))
        await state.update_data(day_of_birth=str(callback_data.day).zfill(2))

        message_text = f'День, в который Вы родились: ' \
                       f'{str(callback_data.day).zfill(2)}.' \
                       f'{str(callback_data.month + 1).zfill(2)}.' \
                       f'{str(callback_data.year).zfill(4)} \n' \
                       f'В какое время Вы родились? \n' \
                       f'Пожалуйста, введите время в формате ЧЧ:ММ.'
        await SendMessage(chat_id=callback.from_user.id, reply_markup=return_to_start_menu_kb(), text=message_text)

        await state.set_state(NatalState.natal_time_of_birth)


@router.message(NatalState.natal_date_of_birth, flags={"throttling_key": "text"})
async def calendar_manual(
        message: Message,
        state: FSMContext
) -> None:
    date_input = message.text

    try:
        valid_date = datetime.strptime(date_input, '%d.%m.%Y').date()

        await state.update_data(year_of_birth=str(valid_date.year).zfill(4))
        await state.update_data(month_of_birth=str(valid_date.month).zfill(2))
        await state.update_data(day_of_birth=str(valid_date.day).zfill(2))

        message_text = f'День, в который Вы родились: ' \
                       f'{str(valid_date.day).zfill(2)}.' \
                       f'{str(valid_date.month).zfill(2)}.' \
                       f'{str(valid_date.year).zfill(4)} \n' \
                       f'В какое время Вы родились? \n' \
                       f'Пожалуйста, введите время в формате ЧЧ:ММ.'
        await SendMessage(chat_id=message.chat.id, text=message_text)

        await state.set_state(NatalState.natal_time_of_birth)

    except ValueError:
        await SendMessage(chat_id=message.chat.id,
                          text="Пожалуйста, удостовертесь, что Вы ввели дату в правильном формате (ДД.ММ.ГГГГ), "
                               "либо воспользуйтесь календарем.",
                          reply_markup=await dialogcalendar.start_calendar())


@router.message(NatalState.natal_time_of_birth, flags={"throttling_key": "request"})
async def natal_time_of_birth(
        message: Message,
        state: FSMContext,
        session: AsyncSession
) -> None:
    time_of_birth = message.text

    if not check_time_validity(time_of_birth):
        message_text = "Пожалуйста, правильность ввода времени рождения. \n" \
                       "Введите время в формате ЧЧ:ММ, например 09:21."
        await SendMessage(chat_id=message.chat.id, text=message_text)
        await state.set_state(NatalState.natal_time_of_birth)

    else:
        await state.update_data(time_of_birth=message.text)

        message_text = f'Время Вашего рождения: {message.text} \n' \
                       f'Натальная карта генерируется, пожалуйста, подождите.'
        await SendMessage(chat_id=message.chat.id, text=message_text)

        async with ChatActionSender.upload_photo(chat_id=message.chat.id):
            await generate_natal_summary(chat_id=message.chat.id, show_save_to_db_button=True,
                                         state=state, file_paths=file_paths, session=session)


@router.callback_query(SaveDataToDBCallbackFactory.filter(), flags={"throttling_key": "text"})
async def callbacks_save_user_info_to_db_menu(
        callback: types.CallbackQuery,
        state: FSMContext,
        session: AsyncSession,
):
    fsm_data = await state.get_data()

    username = fsm_data["username"]
    datetime_of_birth = datetime.strptime(f'{fsm_data["day_of_birth"]}'
                                          f'{fsm_data["month_of_birth"]}'
                                          f'{fsm_data["year_of_birth"]}'
                                          f'{fsm_data["time_of_birth"]}', "%d%m%Y%H:%M")
    place_of_birth = fsm_data["place_of_birth"]
    photo_file_id = fsm_data["photo_file_id"]
    telegraph_link = fsm_data["telegraph_link"]

    await log_user_info(session, callback.from_user.id, username, datetime_of_birth,
                        place_of_birth, photo_file_id, telegraph_link)

    await SendMessage(chat_id=callback.from_user.id, text="Данные сохранены!")
    await SendMessage(chat_id=callback.from_user.id, text="Выберите свой знак зодиака ниже 🔮",
                      reply_markup=all_signs_inline_kb())

    await callback.answer()
