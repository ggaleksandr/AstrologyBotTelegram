from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.keyboards.kb_sign_menu import ReturnToStartCallbackFactory


def return_to_start_menu_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Вернуться к главному меню ↩",
              callback_data=ReturnToStartCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)
