from typing import Any, Awaitable, Callable, Dict

from aiogram import BaseMiddleware
from aiogram.dispatcher.flags import get_flag
from aiogram.methods.send_message import SendMessage
from aiogram.types import Message, TelegramObject, CallbackQuery
from cachetools import TTLCache

THROTTLE_TIME_CALENDAR = 0.2
THROTTLE_TIME_TEXT = 0.3
THROTTLE_TIME_PHOTO = 0.5
THROTTLE_TIME_REQUEST = 2


class ThrottlingMiddleware(BaseMiddleware):
    caches = {
        "calendar": TTLCache(maxsize=10_000, ttl=THROTTLE_TIME_CALENDAR),
        "text": TTLCache(maxsize=10_000, ttl=THROTTLE_TIME_TEXT),
        "photo": TTLCache(maxsize=10_000, ttl=THROTTLE_TIME_PHOTO),
        "request": TTLCache(maxsize=10_000, ttl=THROTTLE_TIME_REQUEST)
    }

    async def __call__(
            self,
            handler: Callable[[TelegramObject, Dict[str, Any]], Awaitable[Any]],
            event: TelegramObject,
            data: Dict[str, Any],
    ) -> Any:
        throttling_key = get_flag(data, "throttling_key")
        if throttling_key is not None and throttling_key in self.caches:

            is_callback = False
            if isinstance(event, CallbackQuery):
                is_callback = True
                chat_id = event.message.chat.id
            elif isinstance(event, Message):
                chat_id = event.chat.id

            if chat_id in self.caches[throttling_key]:
                text_message = "От Вас поступает очень много запросов. \n" \
                               "Пожалуйста, подождите несколько секунд. \n" \
                               "Спасибо за понимание!"
                await SendMessage(chat_id=chat_id, text=text_message)
                if is_callback:
                    await event.answer()
                return
            else:
                self.caches[throttling_key][chat_id] = None

        return await handler(event, data)
