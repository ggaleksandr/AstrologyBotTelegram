import logging

import nats

from bot.configreader import config
from bot.configs.nats_config import config_stream, config_consumer_send_spam, config_consumer_save_ids, \
    config_consumer_send_horoscopes

logger = logging.getLogger(__name__)


async def nats_setup():
    try:
        nc = await nats.connect(config.nats_dsn)
        js = nc.jetstream()

        await js.add_stream(name='NATS_stream', config=config_stream)
        await js.add_consumer(stream='NATS_stream', config=config_consumer_send_spam)
        await js.add_consumer(stream='NATS_stream', config=config_consumer_save_ids)
        await js.add_consumer(stream='NATS_stream', config=config_consumer_send_horoscopes)

        await nc.close()

    except Exception as e:
        logger.warning(e)
