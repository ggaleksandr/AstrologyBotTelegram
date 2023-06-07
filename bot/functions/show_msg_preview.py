from typing import Any, Optional

from aiogram.methods.send_animation import SendAnimation
from aiogram.methods.send_message import SendMessage
from aiogram.methods.send_photo import SendPhoto
from aiogram.methods.send_video import SendVideo
from aiogram.methods.send_video_note import SendVideoNote

from bot.functions.build_kb_from_buttons import build_kb_from_buttons
from bot.keyboards.kb_admin_panel import admin_panel_spam_content_verify_inline_kb


async def show_msg_preview(
        message_data:  dict[str, Any],
        chat_id: int,
        kb_parameters: Optional[list] = [1],
) -> None:
    target_text = message_data["target_text"]
    target_photo = message_data["target_photo"]
    target_video = message_data["target_video"]
    target_animation = message_data["target_animation"]
    target_video_note = message_data["target_video_note"]
    inline_buttons = message_data["inline_buttons"]

    reply_markup = build_kb_from_buttons(inline_buttons, kb_parameters)

    try:
        await SendMessage(chat_id=chat_id, text="Превью сообщения ⬇️")

        if target_photo is not None:
            await SendPhoto(chat_id=chat_id, reply_markup=reply_markup,
                            photo=target_photo, caption=target_text)

        elif target_video is not None:
            await SendVideo(chat_id=chat_id, reply_markup=reply_markup,
                            video=target_video, caption=target_text)

        elif target_animation is not None:
            await SendAnimation(chat_id=chat_id, reply_markup=reply_markup,
                                animation=target_animation, caption=target_text)

        elif target_video_note is not None:
            await SendVideoNote(chat_id=chat_id, reply_markup=reply_markup,
                                video_note=target_video_note, caption=None)

        else:
            await SendMessage(chat_id=chat_id, reply_markup=reply_markup, text=target_text)

        await SendMessage(chat_id=chat_id, reply_markup=admin_panel_spam_content_verify_inline_kb(),
                          text="Выберите следующее действие:")

    except Exception as e:
        await SendMessage(chat_id=chat_id, text=f'Невалидный URL!\n{e}')
