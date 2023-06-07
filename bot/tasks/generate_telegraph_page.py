from typing import Any

from sqlalchemy.ext.asyncio import AsyncSession
from telegraph.aio import Telegraph

from bot.configreader import config
from bot.db.requests import (get_aspect_text, get_house_text,
                             get_planet_in_sign_text)
from bot.logic.enums import PlanetEnums


async def generate_telegraph_page(
        user_instance_json: dict[str, Any],
        session: AsyncSession,
        aspects: list, 
        houses: list
):

    horoscope_texts = "<p><b><h3>Расшифровка знаков планет</h3></b></p>"

    for planet in PlanetEnums:
        planet_name = planet.name.lower()
        planet_id = planet.value
        sign_id = user_instance_json[planet_name]['sign_num'] + 1

        planet_in_sign_text_string = await get_planet_in_sign_text(session, planet_id, sign_id)
        horoscope_texts += planet_in_sign_text_string

    horoscope_texts += "<p><b><h3>Расшифровка аспектов</h3></b></p>"

    for aspect in aspects:
        planet1 = aspect['p1']
        planet2 = aspect['p2']
        aspect = aspect['aid']

        aspect_text = await get_aspect_text(session, planet1, planet2, aspect)
        horoscope_texts += aspect_text

    horoscope_texts += "<p><b><h3>Расшифровка домов</h3></b></p>"

    for house in houses:
        house_id = house['name']
        sign_id = house['sign_num']
        house_id = int(house_id)
        house_text = await get_house_text(session, house_id, sign_id)
        horoscope_texts += house_text

    telegraph = Telegraph(config.telegraph_token)

    response = await telegraph.create_page(
        title='Расшифровка натальной карты',
        html_content=horoscope_texts,
        return_content=True
    )
    unique_url = response['url']

    return unique_url
