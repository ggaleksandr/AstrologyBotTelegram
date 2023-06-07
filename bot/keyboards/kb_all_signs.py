from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import BasicSignMenuCallbackFactory, NatalMenuCallbackFactory


def all_signs_inline_kb() -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    kb.button(text="♈ Овен",
              callback_data=BasicSignMenuCallbackFactory(sign="Aries", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♉ Телец",
              callback_data=BasicSignMenuCallbackFactory(sign="Taurus", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♊ Близнецы",
              callback_data=BasicSignMenuCallbackFactory(sign="Gemini", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♋ Рак",
              callback_data=BasicSignMenuCallbackFactory(sign="Cancer", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♌ Лев",
              callback_data=BasicSignMenuCallbackFactory(sign="Leo", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♍ Дева",
              callback_data=BasicSignMenuCallbackFactory(sign="Virgo", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♎ Весы",
              callback_data=BasicSignMenuCallbackFactory(sign="Libra", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♏ Скорпион",
              callback_data=BasicSignMenuCallbackFactory(sign="Scorpio", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♐ Стрелец",
              callback_data=BasicSignMenuCallbackFactory(sign="Sagittarius", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♑ Козерог",
              callback_data=BasicSignMenuCallbackFactory(sign="Capricornus", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♒ Водолей",
              callback_data=BasicSignMenuCallbackFactory(sign="Aquarius", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="♓ Рыбы",
              callback_data=BasicSignMenuCallbackFactory(sign="Pisces", horoscope_type="Basic",
                                                         can_sub=False, can_unsub=False))
    kb.button(text="🌠 Натальная карта",
              callback_data=NatalMenuCallbackFactory(action="Natal"))
    kb.adjust(3, 3, 3, 3)

    return kb.as_markup(resize_keyboard=True)
