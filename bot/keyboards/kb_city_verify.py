from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import VerifyCityInlineButtonCallbackFactory


def verify_city_or_return() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="Да, все верно ✅",
              callback_data=VerifyCityInlineButtonCallbackFactory(action="Verify"))
    kb.button(text="Изменить место рождения ↩",
              callback_data=VerifyCityInlineButtonCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)
