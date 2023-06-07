import time


def check_time_validity(
        input_time: str
):
    if len(input_time) != 5:
        return False

    try:
        time.strptime(input_time, '%H:%M')
        return True

    except ValueError:
        return False

