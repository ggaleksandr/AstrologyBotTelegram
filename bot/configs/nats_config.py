from nats.js import api

config_stream = api.StreamConfig()

config_stream.subjects = ['send.>']
config_stream.storage = "file"
config_stream.num_replicas = 1
config_stream.retention = "workqueue"
config_stream.discard = "new"

config_stream.max_msgs = 30_000_000
config_stream.max_msgs_per_subject = 10_000_000
config_stream.max_bytes = 10_737_418_240
# config_stream.max_age = -1
config_stream.max_msg_size = -1
# config_stream.duplicate_window = 120

config_stream.allow_rollup_hdrs = False
config_stream.deny_delete = True
config_stream.deny_purge = False


# consumer
config_consumer_send_spam = api.ConsumerConfig()

config_consumer_send_spam.name = 'NATS_consumer_send_spam'
config_consumer_send_spam.durable_name = 'NATS_consumer_send_spam'
config_consumer_send_spam.deliver_policy = 'all'
config_consumer_send_spam.ack_policy = 'explicit'
config_consumer_send_spam.max_deliver = -1
config_consumer_send_spam.filter_subject = 'send.spam'
config_consumer_send_spam.replay_policy = 'instant'
config_consumer_send_spam.max_ack_pending = 0
# config_consumer_send_spam.headers_only = 0


# conusmer
config_consumer_save_ids = api.ConsumerConfig()

config_consumer_save_ids.name = 'NATS_consumer_save_ids'
config_consumer_save_ids.durable_name = 'NATS_consumer_save_ids'
config_consumer_save_ids.deliver_policy = 'all'
config_consumer_save_ids.ack_policy = 'explicit'
config_consumer_save_ids.max_deliver = -1
config_consumer_save_ids.filter_subject = 'send.file_ids'
config_consumer_save_ids.replay_policy = 'instant'
config_consumer_save_ids.max_ack_pending = 0
# config_consumer_save_ids.headers_only = 0


# consumer
config_consumer_send_horoscopes = api.ConsumerConfig()

config_consumer_send_horoscopes.name = 'NATS_consumer_send_horoscopes'
config_consumer_send_horoscopes.durable_name = 'NATS_consumer_send_horoscopes'
config_consumer_send_horoscopes.deliver_policy = 'all'
config_consumer_send_horoscopes.ack_policy = 'explicit'
config_consumer_send_horoscopes.max_deliver = -1
config_consumer_send_horoscopes.filter_subject = 'send.horoscopes'
config_consumer_send_horoscopes.replay_policy = 'instant'
config_consumer_send_horoscopes.max_ack_pending = 0
# config_consumer_save_ids.headers_only = 0