from aiogram import Router
from aiogram.filters.chat_member_updated import ChatMemberUpdatedFilter, MEMBER, KICKED
from aiogram.types import ChatMemberUpdated
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.requests import log_user, log_user_ban

router = Router()


@router.my_chat_member(ChatMemberUpdatedFilter(member_status_changed=KICKED))
async def user_blocked_bot(
    session: AsyncSession,
    event: ChatMemberUpdated
) -> None:
    await log_user_ban(session, event.from_user.id)


@router.my_chat_member(ChatMemberUpdatedFilter(member_status_changed=MEMBER))
async def user_unblocked_bot(
    session: AsyncSession,
    event: ChatMemberUpdated
) -> None:
    await log_user(session, event.from_user.id)
