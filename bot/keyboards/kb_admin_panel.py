
from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import (AdminPanelCallbackFactory,
                              AdminPanelSpamVerifyCallbackFactory,
                              AdminPanelStreamPurgeCallbackFactory)


def admin_panel_start_inline_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Добавить админа",
              callback_data=AdminPanelCallbackFactory(action="Add"))
    kb.button(text="Список админов",
              callback_data=AdminPanelCallbackFactory(action="List"))
    kb.button(text="Сделать рассылку",
              callback_data=AdminPanelCallbackFactory(action="Spam"))
    # kb.button(text="Расписание рассылок",
    #           callback_data=AdminPanelCallbackFactory(action="Schedule"))
    # kb.button(text="Забанить пользователя",
    #           callback_data=AdminPanelCallbackFactory(action="Ban"))
    # kb.button(text="Разбанить пользователя",
    #           callback_data=AdminPanelCallbackFactory(action="Unban"))
    kb.button(text="Статистика",
              callback_data=AdminPanelCallbackFactory(action="Statistics"))
    kb.button(text="Очистить отложку",
              callback_data=AdminPanelCallbackFactory(action="Purge"))
    kb.button(text="Вернуться к главному меню ↩",
              callback_data=AdminPanelCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)


def admin_panel_spam_content_verify_inline_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Отправить",
              callback_data=AdminPanelSpamVerifyCallbackFactory(action="Sent_msg"))
    # kb.button(text="Отредактировать",
    #           callback_data=AdminPanelSpamVerifyCallbackFactory(action="Edit_msg"))
    kb.button(text="Добавить Inline кнопку",
              callback_data=AdminPanelSpamVerifyCallbackFactory(action="Add_inline_button_msg"))
    kb.button(text="Изменить параметры клавиатуры",
              callback_data=AdminPanelSpamVerifyCallbackFactory(action="Set_kb_adjust"))
    kb.button(text="Установить время отправки",
              callback_data=AdminPanelSpamVerifyCallbackFactory(action="Set_schedule_datetime"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)


def admin_panel_stream_purge_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Да, удалить все из рассылки",
              callback_data=AdminPanelStreamPurgeCallbackFactory(action="Purge_confirmation"))
    kb.button(text="Нет, не трогать рассылку",
              callback_data=AdminPanelStreamPurgeCallbackFactory(action="Purge_cancel"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)