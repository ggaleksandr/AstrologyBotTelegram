from aiogram.fsm.state import State, StatesGroup


class MainMenuState(StatesGroup):
    start_menu = State()
    sign_menu = State()
    horoscope_type = State()


class NatalState(StatesGroup):
    natal_username = State()
    natal_place_of_birth = State()
    natal_date_of_birth = State()
    natal_time_of_birth = State()


class AdminState(StatesGroup):
    admin_add = State()
    admin_purge = State()
    admin_set_spam_content = State()
    admin_send_inline_button_text = State()
    admin_send_inline_button_url = State()
    admin_send_inline_kb_parameters = State()
    admin_send_datetime_parameters = State()
    admin_sent_edit_msg = State()
