#!/bin/bash

set -x -e

# Replace horoscope_bot_user, SUPERUSER_PASSWORD and horoscope_bot_db with your own values
# Don't forget to change them in .env file too!

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER horoscope_bot_user WITH PASSWORD 'SUPERUSER_PASSWORD';
    CREATE DATABASE horoscope_bot_db;
    GRANT ALL PRIVILEGES ON DATABASE horoscope_bot_db TO horoscope_bot_user;
    ALTER DATABASE horoscope_bot_db OWNER TO horoscope_bot_user;
EOSQL

psql -U horoscope_bot_user -d horoscope_bot_db < /var/lib/postgresql/dump/sqlfile.sql