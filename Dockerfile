# Separate build image
FROM python:3.10.4-bullseye as compile-image
RUN python -m venv /horoscope_bot/venv
ENV PATH="/horoscope_bot/venv/bin:$PATH"
COPY requirements.txt .

RUN apt-get update \
 && apt-get install -y gcc \
 && pip install --no-cache-dir --upgrade pip \
 && pip install --no-cache-dir setuptools wheel \
 && pip install --no-cache-dir -r requirements.txt \
 && rm -rf /var/lib/apt/lists/*

# Final image
FROM python:3.10.4-bullseye
COPY --from=compile-image /horoscope_bot/venv /horoscope_bot/venv
ENV PATH="/horoscope_bot/venv/bin:$PATH"
WORKDIR /app
COPY alembic.ini /app/alembic.ini
COPY alembic /app/alembic
COPY data /app/data
COPY bot /app/bot
CMD ["python", "-m", "bot"]
