from typing import Optional

from aiogram.utils.keyboard import InlineKeyboardBuilder


def build_kb_from_buttons(
        inline_buttons: list,
        kb_parameters: Optional[list] = [1],
):
    kb = InlineKeyboardBuilder()
    nested_inline_buttons = []

    for i in range(0, len(inline_buttons), 2):
        nested_inline_buttons.append([inline_buttons[i], inline_buttons[i + 1]])

    for button_info in nested_inline_buttons:
        kb.button(text=button_info[0], url=button_info[1])
    try:
        kb.adjust(*kb_parameters, repeat=False)
    except:
        kb.adjust(1, repeat=False)

    reply_markup = kb.as_markup(resize_keyboard=True)

    return reply_markup
