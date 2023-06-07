from datetime import datetime


def validate_datetime(
        datetime_str: str
):
    try:
        datetime_obj = datetime.strptime(datetime_str, '%Y-%m-%d %H:%M')

        if datetime_obj > datetime.now():
            return True
        else:
            return False

    except ValueError:
        return False
