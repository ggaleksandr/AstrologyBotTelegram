import asyncio
import functools


def async_wrapper(func):
    async def decorator(*args, **kwargs):
        loop = asyncio.get_event_loop()
        result = await loop.run_in_executor(
            None, functools.partial(func, *args, **kwargs)
        )
        return result

    return decorator
