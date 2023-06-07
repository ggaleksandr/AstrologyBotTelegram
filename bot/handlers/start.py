from aiogram import Router
from aiogram.filters.command import Command
from aiogram.fsm.context import FSMContext
from aiogram.types import Message
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.requests import log_user
from bot.keyboards.kb_all_signs import all_signs_inline_kb
from bot.logic.states import MainMenuState

flags = {"throttling_key": "text"}
router = Router()


@router.message(Command(commands=["start"]), flags=flags)
async def cmd_start(
    message: Message,
    state: FSMContext,
    session: AsyncSession
) -> None:

    await state.set_state(MainMenuState.start_menu)
    await message.answer(text="Выберите свой знак зодиака ниже 🔮",
                         reply_markup=all_signs_inline_kb())

    await log_user(session, message.from_user.id)
