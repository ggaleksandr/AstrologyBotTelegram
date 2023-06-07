from aiogram import Router
from aiogram.filters.command import Command
from aiogram.types import Message
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.requests import mass_unsubscription
from bot.keyboards.kb_all_signs import all_signs_inline_kb

flags = {"throttling_key": "text"}
router = Router()


@router.message(Command(commands=["unsub"]), flags=flags)
async def cmd_unsub(
    message: Message,
    session: AsyncSession
) -> None:
    await mass_unsubscription(session, message.from_user.id)
    await message.answer("Вы успешно отписались от рассылки!")
    await message.answer("Выберите свой знак зодиака ниже 🔮",
                         reply_markup=all_signs_inline_kb())
