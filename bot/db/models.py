from sqlalchemy import (BigInteger, Column, DateTime, ForeignKey, Integer,
                        Text)

from bot.db.base import Base


class UserBase(Base):
    __tablename__ = "user_base"

    pk_user_base = Column(Integer, primary_key=True, autoincrement=True)
    telegram_id = Column(BigInteger, nullable=False, index=True)


class UserInfo(Base):
    __tablename__ = "user_info"

    pk_user_info = Column(Integer, primary_key=True, autoincrement=True)
    telegram_id = Column(BigInteger, nullable=False, index=True)
    username = Column(Text, nullable=False)
    datetime_of_birth = Column(DateTime, nullable=False)
    place_of_birth = Column(Text, nullable=False)
    photo_file_id = Column(Text, nullable=True)
    telegraph_link = Column(Text, nullable=True)


class Signs(Base):
    __tablename__ = "signs"

    pk_signs = Column(Integer, primary_key=True)
    sign_name = Column(Text, nullable=False)


class HoroscopeTypes(Base):
    __tablename__ = "horoscope_types"

    pk_horoscope_types = Column(Integer, primary_key=True, autoincrement=True)
    type_name = Column(Text, nullable=False)


class UserSign(Base):
    __tablename__ = "user_sign"

    pk_user_sign = Column(Integer, primary_key=True, autoincrement=True, unique=True)
    telegram_id = Column(BigInteger, nullable=False)
    fk_sign = Column(Integer, ForeignKey('signs.pk_signs'))
    fk_horoscope_type = Column(Integer, ForeignKey('horoscope_types.pk_horoscope_types'))


class AdminInfo(Base):
    __tablename__ = "admin_info"

    pk_admin_ids = Column(Integer, primary_key=True, autoincrement=True, unique=True)
    admin_id = Column(BigInteger, nullable=False)


class HoroscopeFileIDs(Base):
    __tablename__ = "horoscope_file_ids"

    pk_horoscope_file_ids = Column(Integer, primary_key=True, autoincrement=True, unique=True)
    sign_name = Column(Integer, nullable=False)
    type_name = Column(Integer, nullable=False)
    file_id = Column(Text, nullable=False)


class PlanetInSignTexts(Base):
    __tablename__ = "planet_in_sign_texts"

    pk_planet_in_sign_texts = Column(Integer, primary_key=True, autoincrement=True)
    planet = Column(Integer, nullable=False, index=True)
    sign = Column(Integer, nullable=False, index=True)
    text = Column(Text, nullable=False, index=True)


class AspectTexts(Base):
    __tablename__ = "aspects_texts"

    pk_aspects_texts = Column(Integer, primary_key=True, autoincrement=True)
    planet1 = Column(Integer, nullable=False, index=True)
    planet2 = Column(Integer, nullable=False, index=True)
    aspect = Column(Integer, nullable=False, index=True)
    text = Column(Text, nullable=False, index=True)


class HousesInSignTexts(Base):
    __tablename__ = "houses_texts"

    pk_signs_in_houses_texts = Column(Integer, primary_key=True, autoincrement=True)
    house = Column(Integer, nullable=False, index=True)
    sign = Column(Integer, nullable=False, index=True)
    text = Column(Text, nullable=False, index=True)


class BasicHoroscopeTexts(Base):
    __tablename__ = "basic_horoscope_texts"

    pk_basic_horoscope_texts = Column(Integer, primary_key=True, autoincrement=True)
    horoscope_text = Column(Text, nullable=False, index=True)


class CareerHoroscopeTexts(Base):
    __tablename__ = "career_horoscope_texts"

    pk_career_horoscope_texts = Column(Integer, primary_key=True, autoincrement=True)
    horoscope_text = Column(Text, nullable=False, index=True)


class RomanticHoroscopeTexts(Base):
    __tablename__ = "romantic_horoscope_texts"

    pk_romantic_horoscope_texts = Column(Integer, primary_key=True, autoincrement=True)
    horoscope_text = Column(Text, nullable=False, index=True)
