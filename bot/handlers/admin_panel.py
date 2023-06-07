import nats
from aiogram import Bot
from aiogram import Router, types
from aiogram.filters.command import Command
from aiogram.fsm.context import FSMContext
from aiogram.methods.send_animation import SendAnimation
from aiogram.methods.send_message import SendMessage
from aiogram.methods.send_photo import SendPhoto
from aiogram.methods.send_video import SendVideo
from aiogram.methods.send_video_note import SendVideoNote
from aiogram.types import Message
from sqlalchemy.ext.asyncio import AsyncSession

from bot.configreader import config
from bot.db.requests import (get_admin_info, get_user_amount, log_admin)
from bot.functions.check_datetime_validity import validate_datetime
from bot.functions.show_msg_preview import show_msg_preview
from bot.keyboards.kb_admin_panel import (
    admin_panel_spam_content_verify_inline_kb,
    admin_panel_start_inline_kb,
    admin_panel_stream_purge_kb)
from bot.keyboards.kb_all_signs import all_signs_inline_kb
from bot.logic.cbdata import (AdminPanelCallbackFactory,
                              AdminPanelSpamVerifyCallbackFactory,
                              AdminPanelStreamPurgeCallbackFactory)
from bot.logic.states import AdminState, MainMenuState
from bot.tasks.spam_to_users_nats import spam_writer, spam_listener

router = Router()


@router.message(Command(commands=["admin"]))
async def admin_start(
        message: Message,
        state: FSMContext,
        session: AsyncSession
) -> None:
    await state.clear()

    admin_infos = await get_admin_info(session, message.from_user.id)
    await state.update_data(inline_buttons=[])

    if len(admin_infos) == 0:
        return

    for admin_info in admin_infos:
        if admin_info.admin_id == message.from_user.id:
            await SendMessage(chat_id=message.from_user.id, reply_markup=admin_panel_start_inline_kb(),
                              text="Добро пожаловать в админ панель!")
            # set default values
            await state.update_data(inline_buttons=[])
            await state.update_data(kb_parameters_string='1')
            await state.update_data(sched_time='0001-01-01 00:00')
            return


@router.callback_query(AdminPanelCallbackFactory.filter())
async def callbacks_admin_panel(
        callback: types.CallbackQuery,
        callback_data: AdminPanelCallbackFactory,
        state: FSMContext,
        session: AsyncSession,
) -> None:
    if callback_data.action == "Start":
        await SendMessage(chat_id=callback.from_user.id, reply_markup=admin_panel_start_inline_kb(),
                          text="Добро пожаловать в админ панель!")

    elif callback_data.action == "Add":
        await state.set_state(AdminState.admin_add)
        await SendMessage(chat_id=callback.from_user.id,
                          text="Введите Telegram ID пользователя, которого хотите сделать админом")

    elif callback_data.action == "List":
        admin_infos = await get_admin_info(session, None)
        admin_list = ''
        for admin_info in admin_infos:
            admin_list += str(admin_info.admin_id) + '\n'

        await SendMessage(chat_id=callback.from_user.id, text=f'Список админов:\n{admin_list}')
        await SendMessage(chat_id=callback.from_user.id, reply_markup=admin_panel_start_inline_kb(),
                          text='Добро пожаловать в админ панель!')

    elif callback_data.action == "Spam":
        await SendMessage(chat_id=callback.from_user.id,
                          text="Введите текст сообщения, прикрепите фотографию/видео/GIF")
        await state.set_state(AdminState.admin_set_spam_content)

    # elif callback_data.action == "Schedule":
    #     print("if callback_data.action == Schedule")
    #     print('TBD')

    # elif callback_data.action == "Ban":
    #     print("if callback_data.action == Ban")
    #     print('TBD')

    # elif callback_data.action == "Unban":
    #     print("if callback_data.action == Unban")
    #     print('TBD')

    elif callback_data.action == "Statistics":
        number_of_users = await get_user_amount(session)
        await SendMessage(chat_id=callback.from_user.id, text=f'Число пользователей: {number_of_users}')

    elif callback_data.action == "Purge":
        await state.set_state(AdminState.admin_purge)
        await SendMessage(chat_id=callback.from_user.id, reply_markup=admin_panel_stream_purge_kb(),
                          text=f'Вы уверены?')

    elif callback_data.action == "Return":
        await SendMessage(chat_id=callback.from_user.id, reply_markup=all_signs_inline_kb(),
                          text="Выберите свой знак зодиака ниже 🔮")
        await state.set_state(MainMenuState.start_menu)

    await callback.answer()


@router.message(AdminState.admin_add)
async def add_admin(
        message: Message,
        session: AsyncSession,
) -> None:
    try:
        await log_admin(session, telegram_id=int(message.text))
        await SendMessage(chat_id=message.chat.id, text="Админ добавлен!")
    except ValueError as e:
        await SendMessage(chat_id=message.chat.id, text=f'Ошибка!\nВведите ID.\n{e}')


@router.callback_query(AdminPanelStreamPurgeCallbackFactory.filter(), AdminState.admin_purge)
async def stream_purge(
        callback: types.CallbackQuery,
        callback_data: AdminPanelStreamPurgeCallbackFactory,
        state: FSMContext
) -> None:
    if callback_data.action == "Purge_confirmation":
        nc = await nats.connect(config.nats_dsn)
        js = nc.jetstream()
        await js.purge_stream(name='NATS_stream', subject='send.spam')
        await nc.close()

        await SendMessage(chat_id=callback.from_user.id, text="Отложка очищена")

        await SendMessage(chat_id=callback.from_user.id, reply_markup=all_signs_inline_kb(),
                          text="Выберите свой знак зодиака ниже 🔮")
        await state.set_state(MainMenuState.start_menu)

    elif callback_data.action == "Purge_cancel":
        await SendMessage(chat_id=callback.from_user.id, reply_markup=all_signs_inline_kb(),
                          text="Выберите свой знак зодиака ниже 🔮")
        await state.set_state(MainMenuState.start_menu)

    await callback.answer()


@router.message(AdminState.admin_set_spam_content)
async def set_msg_content(
        message: Message,
        state: FSMContext
) -> None:
    await state.update_data(target_text=message.caption)
    await state.update_data(target_photo=None)
    await state.update_data(target_video=None)
    await state.update_data(target_animation=None)
    await state.update_data(target_video_note=None)

    if message.photo is not None:
        await state.update_data(target_photo=message.photo[-1].file_id)
        await SendPhoto(chat_id=message.chat.id, reply_markup=admin_panel_spam_content_verify_inline_kb(),
                        photo=message.photo[-1].file_id, caption=f'Ваше сообщение:\n{message.caption}')

    elif message.video is not None:
        await state.update_data(target_video=message.video.file_id)
        await SendVideo(chat_id=message.chat.id, reply_markup=admin_panel_spam_content_verify_inline_kb(),
                        video=message.video.file_id, caption=f'Ваше сообщение:\n{message.caption}')

    elif message.animation is not None:
        await state.update_data(target_animation=message.animation.file_id)
        await SendAnimation(chat_id=message.chat.id, reply_markup=admin_panel_spam_content_verify_inline_kb(),
                            animation=message.animation.file_id, caption=f'Ваше сообщение:\n{message.caption}')

    elif message.video_note is not None:
        await state.update_data(target_video_note=message.video_note.file_id)
        await SendVideoNote(chat_id=message.chat.id, video_note=message.video_note.file_id,
                            reply_markup=admin_panel_spam_content_verify_inline_kb())

    else:
        await state.update_data(target_text=message.text)
        await SendMessage(chat_id=message.chat.id, reply_markup=admin_panel_spam_content_verify_inline_kb(),
                          text=f'Ваше сообщение:\n{message.text}')

    await state.set_state(AdminState.admin_sent_edit_msg)


@router.message(AdminState.admin_send_inline_button_text)
async def add_inline_button_text(
        message: Message,
        state: FSMContext
) -> None:
    message_data = await state.get_data()
    inline_buttons = message_data["inline_buttons"]

    inline_buttons.append(message.text)

    await state.update_data(target_inline_button_text=message.text)
    await state.update_data(inline_buttons=inline_buttons)

    await SendMessage(chat_id=message.chat.id, text="Введите URL для кнопки:")
    await state.set_state(AdminState.admin_send_inline_button_url)


@router.message(AdminState.admin_send_inline_button_url)
async def add_inline_button_url(
        message: Message,
        state: FSMContext
) -> None:
    message_data = await state.get_data()
    inline_buttons = message_data["inline_buttons"]

    inline_buttons.append(message.text)

    await state.update_data(target_inline_button_url=message.text)
    await state.update_data(inline_buttons=inline_buttons)

    await state.set_state(AdminState.admin_sent_edit_msg)
    await show_msg_preview(message_data, message.from_user.id)


@router.message(AdminState.admin_send_inline_kb_parameters)
async def set_kb_parameters(
        message: Message,
        state: FSMContext
) -> None:
    message_data = await state.get_data()

    kb_parameters_string = message.text
    await state.update_data(kb_parameters_string=kb_parameters_string)

    kb_parameters = [int(x) for x in message.text.split(',')]

    await show_msg_preview(message_data, message.chat.id, kb_parameters)
    await state.set_state(AdminState.admin_sent_edit_msg)


@router.message(AdminState.admin_send_datetime_parameters)
async def set_target_id(
        message: Message,
        state: FSMContext
) -> None:
    sched_time = message.text
    is_valid = validate_datetime(sched_time)

    if is_valid:
        message_data = await state.get_data()
        await SendMessage(chat_id=message.chat.id, text=f'Сообщение будет отправлено в {message.text}')
        await show_msg_preview(message_data, message.chat.id)
        await state.update_data(sched_time=sched_time)
        await state.set_state(AdminState.admin_sent_edit_msg)

    else:
        text = "Ошибка!\nВведите время отправки сообщения в формате  <code>ГГГГ-ММ-ДД ЧЧ:ММ</code>"
        await SendMessage(chat_id=message.chat.id, text=text)
        await state.set_state(AdminState.admin_send_datetime_parameters)


@router.callback_query(AdminPanelSpamVerifyCallbackFactory.filter(), AdminState.admin_sent_edit_msg)
async def sent_edit_msg_content(
        callback: types.CallbackQuery,
        callback_data: AdminPanelSpamVerifyCallbackFactory,
        state: FSMContext,
        session: AsyncSession,
        bot: Bot,
) -> None:
    if callback_data.action == "Sent_msg":
        message_data = await state.get_data()

        spam_message = {"text": message_data["target_text"],
                        "photo": message_data["target_photo"],
                        "video": message_data["target_video"],
                        "animation": message_data["target_animation"],
                        "video_note": message_data["target_video_note"],
                        "sched_time": message_data["sched_time"],
                        "inline_buttons": message_data["inline_buttons"],
                        "kb_parameters_string": message_data["kb_parameters_string"],
                        }

        print(f'spam msg in admin_panel.py {spam_message}')

        # NATS
        await spam_writer(spam_message, session)
        await spam_listener(bot)

        await SendMessage(chat_id=callback.from_user.id, text='Задача загруженна в NATS!')
        await SendMessage(chat_id=callback.from_user.id, reply_markup=all_signs_inline_kb(),
                          text="Выберите свой знак зодиака ниже 🔮")
        await state.set_state(MainMenuState.start_menu)

    elif callback_data.action == "Add_inline_button_msg":

        await SendMessage(chat_id=callback.from_user.id, text="Введите текст кнопки")
        await state.set_state(AdminState.admin_send_inline_button_text)

    elif callback_data.action == "Set_kb_adjust":

        message_data = await state.get_data()
        inline_buttons = message_data["inline_buttons"]

        if not inline_buttons:
            await SendMessage(chat_id=callback.from_user.id, text="Не найдены параметры клавиатуры!")
            await show_msg_preview(message_data, callback.from_user.id)
            await state.set_state(AdminState.admin_sent_edit_msg)
        else:
            await SendMessage(chat_id=callback.from_user.id, text="Введите параметры клавиатуры")
            await state.set_state(AdminState.admin_send_inline_kb_parameters)

    elif callback_data.action == "Set_schedule_datetime":

        await SendMessage(chat_id=callback.from_user.id,
                          text="Введите время отправки сообщения в формате <code>ГГГГ-ММ-ДД ЧЧ:ММ</code>")

        await state.set_state(AdminState.admin_send_datetime_parameters)

    await callback.answer()
