import logging

from aiogram import Router, types
from aiogram.fsm.context import FSMContext
from aiogram.methods import EditMessageReplyMarkup
from aiogram.methods.send_photo import SendPhoto
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.models import UserSign
from bot.db.requests import (get_file_id, get_subscriptions_by_id,
                             log_subscription, log_unsubscription)
from bot.keyboards.kb_sign_menu import (BasicSignMenuCallbackFactory,
                                        sign_inline_kb)
from bot.logic.enums import HoroscopeTypeEnums, SignEnums
from bot.logic.states import MainMenuState

flags = {"throttling_key": "photo"}

logger = logging.getLogger(__name__)

router = Router()


@router.callback_query(BasicSignMenuCallbackFactory.filter(), flags=flags)
async def callbacks_sign_menu(
        callback: types.CallbackQuery,
        callback_data: BasicSignMenuCallbackFactory,
        state: FSMContext,
        session: AsyncSession
) -> None:
    current_state = await state.get_state()
    is_sub_status_change = False

    if current_state == MainMenuState.start_menu:
        horoscope_type_name_eng = "Basic"
        sign_name_eng = callback_data.sign
        await state.update_data(sign_name_eng=callback_data.sign)
        await state.set_state(MainMenuState.sign_menu)
        await callback.answer()

    elif current_state == MainMenuState.sign_menu or MainMenuState.horoscope_type:
        await state.update_data(sign_name_eng=callback_data.sign)
        data = await state.get_data()
        sign_name_eng = data["sign_name_eng"]
        await state.set_state(MainMenuState.horoscope_type)
        horoscope_type_name_eng = callback_data.horoscope_type

        if callback_data.can_sub == True and callback_data.can_unsub == False:
            logger.info(
                f'User id={callback.from_user.id} subbed to {SignEnums[sign_name_eng].name}')
            await log_subscription(session, callback.from_user.id, SignEnums[sign_name_eng].value,
                                   HoroscopeTypeEnums[horoscope_type_name_eng].value)
            is_sub_status_change = True

    subscriptions = await get_subscriptions_by_id(session, callback.from_user.id)
    subscription: UserSign

    is_user_subscribed = False

    for subscription in subscriptions:
        if subscription.fk_sign == SignEnums[sign_name_eng].value and subscription.fk_horoscope_type == \
                HoroscopeTypeEnums[horoscope_type_name_eng].value:
            is_user_subscribed = True

        if is_user_subscribed == True and callback_data.can_unsub == True:
            if subscription.fk_sign == SignEnums[sign_name_eng].value and subscription.fk_horoscope_type == \
                    HoroscopeTypeEnums[horoscope_type_name_eng].value:

                logger.info(
                    f'User id={callback.from_user.id} unsubbed from {SignEnums[sign_name_eng].name}')

                await log_unsubscription(session, callback.from_user.id, SignEnums[sign_name_eng].value,
                                         HoroscopeTypeEnums[horoscope_type_name_eng].value)

                is_sub_status_change = True
                is_user_subscribed = False

    file_info = await get_file_id(session, SignEnums[sign_name_eng].value,
                                  HoroscopeTypeEnums[horoscope_type_name_eng].value)

    message_text = """ <i>Ежедневный гороскоп:</i> <b>@HoroscopeGuruBot</b> 🔮"""
    reply_markup = sign_inline_kb(horoscope_type_name_eng, sign_name_eng, is_user_subscribed)

    if is_sub_status_change:
        data = await state.get_data()
        message_id = data["message_id"]
        reply_markup = sign_inline_kb(horoscope_type_name_eng, sign_name_eng, is_user_subscribed)
        await EditMessageReplyMarkup(chat_id=callback.from_user.id, message_id=message_id, photo=file_info.file_id,
                                     caption=message_text, reply_markup=reply_markup)

    else:
        message = await SendPhoto(chat_id=callback.from_user.id, photo=file_info.file_id,
                                  caption=message_text, reply_markup=reply_markup)
        await state.update_data(message_id=message.message_id)

    await callback.answer()
