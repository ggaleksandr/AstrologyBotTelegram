from typing import Optional

from aiogram.filters.callback_data import CallbackData


class BasicSignMenuCallbackFactory(CallbackData, prefix="currentSignBasic"):
    sign: str
    horoscope_type: str
    can_sub: bool
    can_unsub: bool
    value: Optional[int]


class CalendarCallback(CallbackData, prefix="calendarCallback"):
    action: str
    year: Optional[int]
    month: Optional[int]
    day: Optional[int]


class NatalMenuCallbackFactory(CallbackData, prefix="natalMenu"):
    action: str
    value: Optional[int]


class ReturnToStartCallbackFactory(CallbackData, prefix="returnToStart"):
    action: str
    value: Optional[int]


class SaveDataToDBCallbackFactory(CallbackData, prefix="saveToDB"):
    action: str
    value: Optional[int]


class LoadDataFromDBCallbackFactory(CallbackData, prefix="loadFromDB"):
    action: str
    value: Optional[int]


class AdminPanelCallbackFactory(CallbackData, prefix="adminPanel"):
    action: str
    value: Optional[int]


class AdminPanelSpamCallbackFactory(CallbackData, prefix="adminPanelSpam"):
    action: str
    value: Optional[int]


class AdminPanelStreamPurgeCallbackFactory(CallbackData, prefix="adminPanelStreamPurge"):
    action: str
    value: Optional[int]


class AdminPanelSpamVerifyCallbackFactory(CallbackData, prefix="adminPanelSpamVerify"):
    action: str
    value: Optional[int]


class VerifyCityInlineButtonCallbackFactory(CallbackData, prefix="VerifyCityInlineButton"):
    action: str
    value: Optional[int]
