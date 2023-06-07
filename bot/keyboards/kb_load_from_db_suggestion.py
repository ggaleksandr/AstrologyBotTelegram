from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import (LoadDataFromDBCallbackFactory,
                              ReturnToStartCallbackFactory)


def return_to_start_menu_or_load_data_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Использовать сохраненные данные 💾",
              callback_data=LoadDataFromDBCallbackFactory(action="Load"))
    kb.button(text="Вернуться к главному меню ↩",
              callback_data=ReturnToStartCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)
