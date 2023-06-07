from aiogram import Bot
from aiogram.types import BotCommand, BotCommandScopeAllPrivateChats


async def set_commands(
    bot: Bot
):
    data = [
        (
            [
                BotCommand(command="start", description="Запуск бота, стартовое меню"),
                BotCommand(command="help", description="Информация о функционале бота"),
                BotCommand(command="unsub", description="Отписаться от ежедневных рассылок"),
            ],
            BotCommandScopeAllPrivateChats(),
            None
        )
    ]

    for commands_list, commands_scope, language in data:
        await bot.set_my_commands(commands=commands_list, scope=commands_scope, language_code=language)
