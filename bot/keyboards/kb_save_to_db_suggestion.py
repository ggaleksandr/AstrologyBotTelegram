from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import (ReturnToStartCallbackFactory,
                              SaveDataToDBCallbackFactory)


def return_to_start_menu_or_save_data_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Сохранить данные 💾",
              callback_data=SaveDataToDBCallbackFactory(action="Save"))
    kb.button(text="Вернуться к главному меню ↩",
              callback_data=ReturnToStartCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)
