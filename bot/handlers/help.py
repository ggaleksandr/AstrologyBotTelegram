from aiogram import Router
from aiogram.filters.command import Command
from aiogram.types import Message

from bot.keyboards.kb_all_signs import all_signs_inline_kb

flags = {"throttling_key": "text"}
router = Router()


@router.message(Command(commands=["help"]), flags=flags)
async def cmd_help(
    message: Message
) -> None:

    await message.answer("""Привет! Я бот, который поможет Вам узнать свой гороскоп на сегодня и составить натальную карту.\n
Для получения гороскопа просто выберите свой знак зодиака в главном меню. Вы можешь подписаться на ежедневную рассылку гороскопов, нажав соответствующую кнопку.\n
Если Вы хотите узнать больше о своей личности и скрытом в Вас потенциале, то можете составить натальную карту.
Для этого необходимо указать Ваше имя (не обязательно настоящее), место рождения, дату рождения и время рождения (желательно максимально точное!).""")
    
    await message.answer(text="Выберите свой знак зодиака ниже 🔮",
                         reply_markup=all_signs_inline_kb())
