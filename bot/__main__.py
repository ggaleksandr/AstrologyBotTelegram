import asyncio
import logging

from aiogram import Bot, Dispatcher, F
from aiogram.client.telegram import TelegramAPIServer
from aiogram.fsm.storage.redis import RedisStorage
from aiogram.webhook.aiohttp_server import SimpleRequestHandler
from aiohttp import web
from apscheduler.schedulers.asyncio import AsyncIOScheduler
from sqlalchemy.ext.asyncio import AsyncSession, create_async_engine
from sqlalchemy.orm import sessionmaker

from bot.configreader import config
from bot.db.requests import log_admin
from bot.handlers import (admin_panel, back, user_ban, help, natal, sign_menu, start,
                          unsub)
from bot.middlewares.db import DbSessionMiddleware
from bot.middlewares.throttling import ThrottlingMiddleware
from bot.tasks.commands import set_commands
from bot.tasks.nats_setup import nats_setup
from bot.tasks.send_horoscopes_to_save_file_id_nats import (
    sent_and_get_file_ids_listener, sent_and_get_file_ids_writer)
from bot.tasks.send_horoscopes_to_subs_nats import subs_listener, subs_writer
from bot.tasks.spam_to_users_nats import spam_listener


async def main():
    # Logging to stdout
    logging.basicConfig(
        level=logging.WARNING,
        format="%(asctime)s - %(levelname)s - %(name)s - %(message)s",
    )

    # Creating DB engine for PostgreSQL
    engine = create_async_engine(config.postgres_dsn, future=True, echo=False)

    # Creating DB connections pool
    db_pool = sessionmaker(engine, expire_on_commit=False, class_=AsyncSession)
    db_pool = sessionmaker(engine, expire_on_commit=False, class_=AsyncSession)

    # Creating bot and its dispatcher
    bot = Bot(token=config.bot_token, parse_mode="HTML")
    if config.custom_bot_api:
        bot.session.api = TelegramAPIServer.from_base(
            config.custom_bot_api, is_local=True)

    # Choosing FSM storage
    if config.bot_fsm_storage == "memory":
        #    dp = Dispatcher(storage=MemoryStorage())
        pass
    else:
        dp = Dispatcher(storage=RedisStorage.from_url(config.redis_dsn))

    # Allow interaction in private chats (not groups or channels) only
    dp.message.filter(F.chat.type == "private")

    # Register middlewares
    dp.message.middleware(DbSessionMiddleware(db_pool))
    dp.callback_query.middleware(DbSessionMiddleware(db_pool))

    # Throttling middlewares
    dp.message.middleware(ThrottlingMiddleware())
    dp.callback_query.middleware(ThrottlingMiddleware())

    dp.include_router(start.router)
    dp.include_router(user_ban.router)
    dp.include_router(help.router)
    dp.include_router(unsub.router)
    dp.include_router(admin_panel.router)
    dp.include_router(sign_menu.router)
    dp.include_router(natal.router)
    dp.include_router(back.router)

    # Register /-commands in UI
    await set_commands(bot)

    @dp.startup()
    async def on_startup():

        async def send_horoscopes_to_subs_task():
            async with db_pool() as session:
                await subs_writer(session)
                await subs_listener(bot)

        async def sent_and_get_file_ids_task():
            async with db_pool() as session:
                await sent_and_get_file_ids_writer(bot, session)
                await sent_and_get_file_ids_listener(bot, session)

        async def spam_listener_task():
            await spam_listener(bot)

        async with db_pool() as session:
            await log_admin(session, config.admin_id)

        await nats_setup()

        await sent_and_get_file_ids_task()

        sched = AsyncIOScheduler()
        sched.add_job(send_horoscopes_to_subs_task, 'cron', hour='09', minute='00',
                      misfire_grace_time=30, replace_existing=True, timezone="Europe/Moscow")
        sched.add_job(sent_and_get_file_ids_task, 'cron', hour='00', minute='00',
                      misfire_grace_time=30, replace_existing=True, timezone="Europe/Moscow")
        # scheduler.add_job(clear_redis, 'cron', id='redis_delete_keys',
        #               day_of_week='mon-sun', hour='00', minute='00', end_date='2023-05-30',
        #               misfire_grace_time=10, replace_existing=True, timezone="Europe/Moscow")
        sched.add_job(spam_listener_task, 'cron', minute='*/5',
                      misfire_grace_time=30, replace_existing=True, timezone="Europe/Moscow")

        sched.start()

    try:
        if not config.webhook_domain:
            await dp.start_polling(bot, allowed_updates=dp.resolve_used_update_types(), config="test")
        else:
            # Suppress aiohttp access log completely
            aiohttp_logger = logging.getLogger("aiohttp.access")
            aiohttp_logger.setLevel(logging.CRITICAL)

            # Setting webhook
            await bot.set_webhook(
                url=config.webhook_domain + config.webhook_path,
                drop_pending_updates=True,
                allowed_updates=dp.resolve_used_update_types()
            )

            # Creating an aiohttp application
            app = web.Application()
            SimpleRequestHandler(dispatcher=dp, bot=bot).register(
                app, path=config.webhook_path)
            runner = web.AppRunner(app)
            await runner.setup()
            site = web.TCPSite(runner, host=config.app_host,
                               port=config.app_port)
            await site.start()

            # Running it forever
            await asyncio.Event().wait()
    finally:
        # state: FSMContext
        await dp.storage.close()
        await dp.storage.wait_closed()
        await bot.session.close()


asyncio.run(main())
