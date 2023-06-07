from aiogram.types import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import (BasicSignMenuCallbackFactory,
                              ReturnToStartCallbackFactory)
from bot.logic.enums import HoroscopeTypeEnums
from bot.tasks.read_config import image_param_horoscope


def sign_inline_kb(
    horoscope_type_name_eng: str,
    sign_name_eng: str,
    is_user_subscribed: bool
) -> InlineKeyboardMarkup:
    kb = InlineKeyboardBuilder()

    sign_emoji = image_param_horoscope["sign_names"][sign_name_eng]["sign_emoji"]

    if HoroscopeTypeEnums[horoscope_type_name_eng].value == 1:
        if is_user_subscribed:
            kb.button(text=f'✅ Подписка на ежедневный общий гороскоп оформлена {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Basic", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=True))
        else:
            kb.button(text=f'✉ Подписаться на ежедневный общий гороскоп {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Basic", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=False))

        kb.button(text=f'Карьерный гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Career", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))
        kb.button(text=f'Любовный гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Romantic", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))

    elif HoroscopeTypeEnums[horoscope_type_name_eng].value == 2:
        kb.button(text=f'Общий гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Basic", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))

        if is_user_subscribed:
            kb.button(text=f'✅ Подписка на ежедневный карьерный гороскоп оформлена {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Career", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=True))
        else:
            kb.button(text=f'✉ Подписаться на ежедневный карьерный гороскоп {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Career", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=False))

        kb.button(text=f'Любовный гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Romantic", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))

    elif HoroscopeTypeEnums[horoscope_type_name_eng].value == 3:
        kb.button(text=f'Общий гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Basic", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))
        kb.button(text=f'Карьерный гороскоп {sign_emoji}',
                  callback_data=BasicSignMenuCallbackFactory(horoscope_type="Career", sign=sign_name_eng,
                                                             can_sub=False, can_unsub=False))

        if is_user_subscribed:
            kb.button(text=f'✅ Подписка на ежедневный любовный гороскоп оформлена {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Romantic", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=True))
        else:
            kb.button(text=f'✉ Подписаться на ежедневный любовный гороскоп {sign_emoji}',
                      callback_data=BasicSignMenuCallbackFactory(horoscope_type="Romantic", sign=sign_name_eng,
                                                                 can_sub=True, can_unsub=False))

    kb.button(text="Вернуться к главному меню ↩",
              callback_data=ReturnToStartCallbackFactory(action="Return"))
    kb.adjust(1)

    return kb.as_markup(resize_keyboard=True)
