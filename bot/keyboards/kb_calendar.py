import calendar
from datetime import datetime

from aiogram.types.inline_keyboard_markup import InlineKeyboardMarkup
from aiogram.utils.keyboard import InlineKeyboardBuilder

from bot.logic.cbdata import CalendarCallback


class DialogCalendar:
    months = ["Янв", "Февр", "Март", "Апр", "Май", "Июнь",
              "Июль", "Авг", "Сент", "Окт", "Нояб", "Дек"]
    days_of_the_week = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]

    def __init__(self, year: int = datetime.now().year, month: int = datetime.now().month):
        self.year = year
        self.month = month

    async def start_calendar(
            self,
            year: int = datetime.now().year - 15
    ) -> InlineKeyboardMarkup:

        kb = InlineKeyboardBuilder()

        for year in range(year - 4, year + 1):
            kb.button(text=f'{year}',
                      callback_data=CalendarCallback(action="SET-YEAR", year=year))

        kb.button(text="<", callback_data=CalendarCallback(
            action="PREV-YEARS", year=year)),
        kb.button(text=">", callback_data=CalendarCallback(
            action="NEXT-YEARS", year=year)),
        kb.adjust(5)

        return kb.as_markup(resize_keyboard=True)

    async def _get_month_kb(self, year: int):

        kb = InlineKeyboardBuilder()

        kb.button(text=" ", callback_data=CalendarCallback(action="IGNORE")),
        kb.button(text=f'{year}', callback_data=CalendarCallback(
            action="START", year=year))
        kb.button(text=" ", callback_data=CalendarCallback(action="IGNORE")),

        for month in self.months[0:6]:
            kb.button(
                text=f'{month}',
                callback_data=CalendarCallback(action="SET-MONTH", year=year, month=self.months.index(month))
            )

        for month in self.months[6:12]:
            kb.button(
                text=f'{month}',
                callback_data=CalendarCallback(action="SET-MONTH", year=year, month=self.months.index(month))
            )

        kb.adjust(3, 6)

        return kb.as_markup(resize_keyboard=True)

    async def _get_days_kb(self, year: int, month: int):

        kb = InlineKeyboardBuilder()

        kb.button(text=f'{year}', callback_data=CalendarCallback(
            action="START", year=year))
        kb.button(text=f'{self.months[month]}', callback_data=CalendarCallback(
            action="SET-YEAR", year=year))

        for day in self.days_of_the_week:
            kb.button(text=f'{day}',
                      callback_data=CalendarCallback(action="IGNORE"))

        month_calendar = calendar.monthcalendar(year, month + 1)

        for week in month_calendar:
            for day in week:
                if day == 0:
                    kb.button(text=" ", callback_data=CalendarCallback(
                        action="IGNORE"))
                    continue

                kb.button(text=f'{str(day)}', callback_data=CalendarCallback(
                    action="SET-DAY", year=year, month=month, day=day))

        kb.adjust(2, 7)

        return kb.as_markup(resize_keyboard=True)
