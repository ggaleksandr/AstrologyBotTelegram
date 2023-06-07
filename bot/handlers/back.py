from aiogram import Router
from aiogram.fsm.context import FSMContext
from aiogram.methods.send_message import SendMessage
from aiogram.types import CallbackQuery

from bot.keyboards.kb_all_signs import all_signs_inline_kb
from bot.keyboards.kb_sign_menu import ReturnToStartCallbackFactory
from bot.logic.states import MainMenuState

flags = {"throttling_key": "text"}
router = Router()


@router.callback_query(ReturnToStartCallbackFactory.filter(), flags=flags)
async def callbacks_sign_menu(
    callback: CallbackQuery,
    state: FSMContext,
):
    await state.set_state(MainMenuState.start_menu)
    await SendMessage(chat_id=callback.from_user.id,
                      reply_markup=all_signs_inline_kb(),  
                      text='Выберите свой знак зодиака ниже 🔮')
    await callback.answer()
