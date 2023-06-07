import logging
from contextlib import suppress
from datetime import datetime

import sqlalchemy
from sqlalchemy import func, select, update
from sqlalchemy.exc import IntegrityError
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.models import (AdminInfo, AspectTexts, BasicHoroscopeTexts,
                           CareerHoroscopeTexts, HoroscopeFileIDs,
                           HousesInSignTexts, PlanetInSignTexts,
                           RomanticHoroscopeTexts, UserBase, UserInfo,
                           UserSign)
from bot.logic.enums import HoroscopeTypeEnums

logger = logging.getLogger(__name__)


async def log_user(
    session: AsyncSession,
    telegram_id: int
):
    """
    Logs user when /start command is sent.

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    entry = UserBase()
    # entry.pk_user_base
    entry.telegram_id = telegram_id

    stmt = select(UserBase).where(UserBase.telegram_id == telegram_id)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        logger.debug('Duplicate row in UserBase table detected')
    else:
        session.add(entry)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def log_user_ban(
    session: AsyncSession,
    telegram_id: int
):
    """
    Logs user ban when he blocks the bot.

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    entry = UserBase()
    # entry.pk_user_base
    entry.telegram_id = telegram_id

    stmt = sqlalchemy.delete(UserBase).where(UserBase.telegram_id == telegram_id)
    await session.execute(stmt)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def log_subscription(
    session: AsyncSession,
    telegram_id: int,
    sign: int,
    horoscope_type: int
):
    """
    Logs user's daily subscription to a horoscope 

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    :param sign: Sign user is subscribed to
    :param horoscope_type: Horoscope type user is subscribed to
    """
    entry = UserSign()
    entry.telegram_id = telegram_id
    entry.fk_sign = sign
    entry.fk_horoscope_type = horoscope_type

    stmt = select(UserSign).where(UserSign.telegram_id == telegram_id,
                                  UserSign.fk_sign == sign, UserSign.fk_horoscope_type == horoscope_type)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        logger.debug('Duplicate row in UserSign table detected')
    else:
        session.add(entry)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def log_unsubscription(
    session: AsyncSession,
    telegram_id: int,
    sign: int,
    horoscope_type: int
):
    """
    Deletes subscription to a specific sign's daily horoscope 

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    :param sign: Sign user is unsubscribed from
    :param horoscope_type: Horoscope type user is unsubscribed from
    """
    stmt = sqlalchemy.delete(UserSign).where(UserSign.telegram_id == telegram_id,
                                             UserSign.fk_sign == sign, UserSign.fk_horoscope_type == horoscope_type)
    await session.execute(stmt)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def get_subscriptions_by_id(
    session: AsyncSession,
    telegram_id: int
):
    """
    Get user's subscriptions

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    user_subscriptions = await session.execute(
        select(UserSign).where(UserSign.telegram_id == telegram_id)
    )
    return user_subscriptions.scalars().all()


async def get_all_subscriptions(
    session: AsyncSession
):
    """
    Get subscriptions from all users for mailing

    :param session: SQLAlchemy DB session
    """
    user_subscriptions = await session.execute(
        select(UserSign).order_by(UserSign.telegram_id,
                                  UserSign.fk_sign.asc(), UserSign.fk_horoscope_type.asc())
    )
    return user_subscriptions.all()


async def log_user_info(
    session: AsyncSession,
    telegram_id: int,
    username: str,
    datetime_of_birth: datetime,
    place_of_birth: str,
    photo_file_id: str,
    telegraph_link: str
):
    """
    Log user natal map info

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    :param username: User's name
    :param datetime_of_birth: Date and time of birth
    :param place_of_birth: User's place of birth
    :param photo_file_id: User's natal map Telegram photo ID
    :param telegraph_link: User's natal map description hosted on Telegraph
    """
    entry = UserInfo()
    entry.telegram_id = telegram_id
    entry.username = username
    entry.datetime_of_birth = datetime_of_birth
    entry.place_of_birth = place_of_birth
    entry.photo_file_id = photo_file_id
    entry.telegraph_link = telegraph_link

    stmt = select(UserInfo).where(UserInfo.telegram_id == telegram_id)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        stmt = (
            update(UserInfo)
            .values(username=entry.username,
                    datetime_of_birth=datetime_of_birth,
                    place_of_birth=place_of_birth,
                    photo_file_id=photo_file_id,
                    telegraph_link=telegraph_link)
            .where(entry.telegram_id == telegram_id)
        )
        await session.execute(stmt)
        logger.debug('Duplicate row in HoroscopeFileIDs table detected')

    else:
        session.add(entry)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def get_user_info_existance_by_id(
    session: AsyncSession,
    telegram_id: int
):
    """
    Check if user natal map info exists

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    stmt = select(UserInfo).where(UserInfo.telegram_id == telegram_id)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        return True


async def get_user_info_by_id(
    session: AsyncSession,
    telegram_id: int
):
    """
    Returns natal map info for user

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    user_info = await session.execute(
        select(UserInfo).where(UserInfo.telegram_id == telegram_id)
    )
    return user_info.scalars().first()


async def get_admin_info(
    session: AsyncSession,
    telegram_id: int
):
    """
    Returns list of admin IDs

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    if telegram_id is None:
        admin_id = await session.execute(
            select(AdminInfo)
        )

    else:
        admin_id = await session.execute(
            select(AdminInfo).where(AdminInfo.admin_id == telegram_id)
        )

    return admin_id.scalars().all()


async def log_admin(
        session: AsyncSession,
        telegram_id: int
):
    """
    Send admin ID to DB

    :param session: SQLAlchemy DB session
    :param telegram_id: New admin's Telegram ID
    """
    entry = AdminInfo()
    entry.admin_id = telegram_id

    stmt = select(AdminInfo).where(AdminInfo.admin_id == telegram_id)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        logger.debug('Duplicate row in AdminInfo table detected')
    else:
        session.add(entry)

    with suppress(IntegrityError):
        await session.commit()


async def get_user_amount(
    session: AsyncSession
):
    """
    Get user amount from database

    :param session: SQLAlchemy DB session
    """
    stmt = select([func.count()]).select_from(UserBase)
    results = await session.execute(stmt)
    row_count = results.scalars().first()

    return row_count


async def get_all_users(
    session: AsyncSession
):
    """
    Get all users from database (for spam purposes) 

    :param session: SQLAlchemy DB session
    """
    users = await session.execute(
        select(UserBase).order_by(UserBase.telegram_id)
    )

    return users.scalars().all()


async def log_file_id(
    session: AsyncSession,
    sign_name: int,
    type_name: int,
    file_id: str
):
    """
    Send photo file ID of daily horoscope to DB

    :param session: SQLAlchemy DB session
    :param sign_name: Sign's enum
    :param type_name: Horoscope's type enum
    :param file_id: Telegram file ID of the photo
    """
    entry = HoroscopeFileIDs()
    entry.sign_name = sign_name
    entry.type_name = type_name
    entry.file_id = file_id

    stmt = select(HoroscopeFileIDs).where(HoroscopeFileIDs.sign_name ==
                                          sign_name, HoroscopeFileIDs.type_name == type_name)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        upd = update(HoroscopeFileIDs)
        upd = upd.values({"file_id": file_id})
        upd = upd.where((HoroscopeFileIDs.sign_name == sign_name)
                        & (HoroscopeFileIDs.type_name == type_name))
        await session.execute(upd)

        logger.info(
            f'Row with sign_name = {sign_name} and type_name = {type_name} in HoroscopeFileIDs table is updated')

    else:
        session.add(entry)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def get_file_id(
    session: AsyncSession,
    sign_name: int,
    type_name: int
):
    """
    Send end game event to database

    :param session: SQLAlchemy DB session
    :param sign_name: User's sign enum
    :param type_name: Horoscope type sign enum
    """
    entry = HoroscopeFileIDs()
    entry.sign_name = sign_name
    entry.type_name = type_name

    file_id = await session.execute(
        select(HoroscopeFileIDs).where(HoroscopeFileIDs.sign_name ==
                                       sign_name, HoroscopeFileIDs.type_name == type_name)
    )
    return file_id.scalars().first()


async def get_planet_in_sign_text(
    session: AsyncSession,
    planet: int,
    sign: int
):
    """
    Send end game event to database

    :param session: SQLAlchemy DB session
    :param planet: planet's enum
    :param sign: sign's enum
    """
    entry = PlanetInSignTexts()

    entry.planet = planet
    entry.sign = sign

    text = await session.execute(
        select(PlanetInSignTexts.text).where(
            PlanetInSignTexts.planet == planet, PlanetInSignTexts.sign == sign)
    )

    planet_in_sign_text = text.scalars().all()
    planet_in_sign_text_string = ''.join(planet_in_sign_text)

    return planet_in_sign_text_string


async def get_aspect_text(
    session: AsyncSession,
    planet1: int,
    planet2: int,
    aspect: int
):
    """
    Get text for a certain aspect for planet 1 and planet 2 from DB

    :param session: SQLAlchemy DB session
    :param planet1: First planet ID
    :param planet2: Second planet ID
    :param aspect: Aspect ID
    """
    text = await session.execute(
        select(AspectTexts.text).where(AspectTexts.planet1 == planet1,
                                       AspectTexts.planet2 == planet2, AspectTexts.aspect == aspect)
    )

    aspect_text = text.scalars().all()
    aspect_text_string = ''.join(aspect_text)

    if not aspect_text_string:
        # if nothing found, swap planets
        text = await session.execute(
            select(AspectTexts.text).where(AspectTexts.planet1 == planet2,
                                           AspectTexts.planet2 == planet1, AspectTexts.aspect == aspect)
        )

        aspect_text = text.scalars().all()
        aspect_text_string = ''.join(aspect_text)

    return aspect_text_string


async def get_house_text(
    session: AsyncSession,
    house: int,
    sign: int
):
    """
    Get text for a certain house and sign from DB

    :param session: SQLAlchemy DB session
    :param house: House number
    :param sign: Sign enum value
    """
    text = await session.execute(
        select(HousesInSignTexts.text).where(
            HousesInSignTexts.house == house, HousesInSignTexts.sign == sign)
    )

    house_text = text.scalars().all()
    house_text_string = ''.join(house_text)

    return house_text_string


async def get_horoscope_text(
    session: AsyncSession,
    horoscope_type: str
):
    """
    Get text from DB for Basic, Career and Romantic horocopres

    :param session: SQLAlchemy DB session
    :param horoscope_type: Horoscope type: Basic, Career and Romantic
    """
    if HoroscopeTypeEnums[horoscope_type].value == 1:
        text = await session.execute(
            select(
                BasicHoroscopeTexts.horoscope_text,
            ).order_by((func.random()))
        )

    elif HoroscopeTypeEnums[horoscope_type].value == 2:
        text = await session.execute(
            select(
                CareerHoroscopeTexts.horoscope_text,
            ).order_by((func.random()))
        )

    elif HoroscopeTypeEnums[horoscope_type].value == 3:
        text = await session.execute(
            select(
                RomanticHoroscopeTexts.horoscope_text,
            ).order_by((func.random()))
        )

    horoscope_text = text.scalars().first()
    horoscope_text_string = ''.join(horoscope_text)

    return horoscope_text_string


async def mass_unsubscription(
    session: AsyncSession,
    telegram_id: int
):
    """
    Deletes all user's subs from databse

    :param session: SQLAlchemy DB session
    :param telegram_id: User's Telegram ID
    """
    stmt = sqlalchemy.delete(UserSign).where(
        UserSign.telegram_id == telegram_id)
    await session.execute(stmt)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()


async def log_admin(
    session: AsyncSession,
    admin_id: int
):
    """
    Saves admins id defined in config when bot is started.

    :param session: SQLAlchemy DB session
    :param admin_id: Admin's Telegram ID
    """
    entry = AdminInfo()
    entry.admin_id = admin_id

    stmt = select(AdminInfo).where(AdminInfo.admin_id == admin_id)
    results = await session.execute(stmt)
    result = results.scalars().first()

    if result is not None:
        logger.debug('Initial admin ID is already saved in DB')
    else:
        session.add(entry)

    with suppress(IntegrityError):
        try:
            await session.commit()
        except:
            await session.rollback()