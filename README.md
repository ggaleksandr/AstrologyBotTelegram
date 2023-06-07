# Horoscope Bot

This bot allows you to create natal charts, read daily horoscopes (basic, career and romantic) and subscribe to daily horoscope mailing.

Available at https://t.me/HoroscopeGuruBot.

## Used technology
* Python;
* Aiogram 3.x (Telegram Bot framework);
* Docker and Docker Compose (containerization);
* PostgreSQL (database);
* Redis (persistent storage for some ongoing game data);
* SQLAlchemy (working with database from Python);
* Alembic (database migrations made easy);
* NATS (horoscopes mailing, spamming and getting file IDs);

## Installation

Create a directory of your choice, let's say `/docker`. 
Inside it, make directories for bot's data:  
`mkdir -p {pg/init,pg/data,pg/dump,redis/config,redis/data,nats/config,nats/data}`

Grab `redis_example.conf` file, rename it to `redis.conf` and put into `/docker/redis/config` directory. 
Change its values for your preference.

Grab `pg_init_user.sh`, put it into `/docker/pg/init`.
Open it, replace `horoscope_bot_user`, `SUPERUSER_PASSWORD` and `horoscope_bot_db` values with your own. Save file.

Grab `sqlfile.sql` SQL dump, put it into `/docker/pg/dump`.

Grab `nats_server_config_example.conf`, rename it to `server.conf` and put it into `/docker/nats/config`. 
Change its values for your preference.

Grab `env_dist` file, rename it to `.env` and put it next to your `docker-compose.yml`, open 
and fill the necessary data. TELEGRAPH_TOKEN, ADMIN_ID, YOURPGPASSWORD, YOURBOTTOKEN should be changed.
Pay attention to POSTGRES_DSN value, sync it with `pg_init_user` values.

Finally, start your bot with `docker-compose up -d` command.
