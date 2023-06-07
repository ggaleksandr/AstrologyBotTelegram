import logging

from bot.kerykeion.fetch_geonames import FetchGeonames

logger = logging.getLogger(__name__)


def check_city_validity(
        city: str
):
    nation: str = ""
    geonames_username: str = 'horoscope.bot'

    geonames = FetchGeonames(city, nation, username=geonames_username)

    city_data: dict[str, str] = geonames.get_serialized_data()

    logger.info(f'Returned Geonames data: {city_data}')

    if (
            not 'countryCode' in city_data or
            not 'timezonestr' in city_data or
            not 'lat' in city_data or
            not 'lng' in city_data or
            not 'cityName' in city_data
    ):
        return False, None

    return True, city_data['cityName']
