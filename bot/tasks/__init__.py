async def send_horoscopes_to_subs_task():
    async with db_pool() as session:
        await subs_writer(session)
        await subs_listener(bot)


async def sent_and_get_file_ids_task():
    async with db_pool() as session:
        await sent_and_get_file_ids_writer(bot, session)
        await sent_and_get_file_ids_listener(bot, session)