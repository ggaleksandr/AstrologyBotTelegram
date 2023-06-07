import io
import textwrap
from datetime import datetime

from PIL import Image, ImageColor, ImageDraw
from sqlalchemy.ext.asyncio import AsyncSession

from bot.db.requests import get_horoscope_text
from bot.functions.draw_text import draw_text
from bot.tasks.read_config import file_paths, image_param_horoscope


async def draw_image(
        sign_name_eng: str,
        horoscope_type_name_eng: str,
        session: AsyncSession
):
    text_to_be_drawn = await get_horoscope_text(session, horoscope_type_name_eng)
    image = Image.open(file_paths["background_image_horoscope_path"])
    draw = ImageDraw.Draw(image)

    main_text_width = image_param_horoscope["image_config"]["main_text_width"]
    wrapped_text = textwrap.wrap(text_to_be_drawn, int(main_text_width), replace_whitespace=False)

    # add forecast text
    font_path = image_param_horoscope['main_text_font_path']
    font_size = image_param_horoscope["image_config"]["main_text_font_size"]
    font_color_hex = image_param_horoscope["image_config"]["font_color_main_text"]
    font_color_rgb = ImageColor.getcolor(font_color_hex, "RGB")

    x_start_main_text = image_param_horoscope["image_config"]["x_start_main_text"]
    y_start_main_text = image_param_horoscope["image_config"]["y_start_main_text"]

    y_main_text_clearance = image_param_horoscope["image_config"]["y_main_text_clearance"]

    current_height = 0

    for line in wrapped_text:
        draw_text(draw, (x_start_main_text, (y_start_main_text + current_height)), [
            (line, font_color_rgb,
             font_path, font_size, 'ls'),
        ])
        current_height += y_main_text_clearance

    # add horoscope_type on the picture
    horoscope_type_name_rus = image_param_horoscope["horoscope_type_names_rus"][horoscope_type_name_eng][
        "horoscope_type_name_rus"]
    horo_type_sign = f'{horoscope_type_name_rus} прогноз'

    x_horoscope_type_sign, y_horoscope_type_sign = image_param_horoscope["image_config"]["x_horoscope_type_sign"], \
                                                   image_param_horoscope["image_config"]["y_horoscope_type_sign"]

    font_path = image_param_horoscope['horoscope_type_sign_font_path']
    font_color_hex = image_param_horoscope["image_config"]["horoscope_type_sign_color"]
    font_color_rgb = ImageColor.getcolor(font_color_hex, "RGB")
    font_size = image_param_horoscope["image_config"]["horoscope_type_sign_font_size"]

    draw_text(draw, (x_horoscope_type_sign, y_horoscope_type_sign), [
        (horo_type_sign, font_color_rgb,
         font_path, font_size, 'la'),
    ])

    # add current date on the picture
    current_month = datetime.now().month
    current_day = str(datetime.now().day)

    current_month_rus = image_param_horoscope["month_list"][current_month - 1]['month_name_rus']
    date = current_day + " " + current_month_rus
    date_sign = f'От {date}'

    x_date_sign, y_date_sign = image_param_horoscope["image_config"]["x_date_sign"], \
                               image_param_horoscope["image_config"]["y_date_sign"]

    font_path = image_param_horoscope['horoscope_date_sign_font_path']
    font_color_hex = image_param_horoscope["image_config"]["horoscope_date_sign_color"]
    font_color_rgb = ImageColor.getcolor(font_color_hex, "RGB")
    font_size = image_param_horoscope["image_config"]["date_sign_font_size"]

    draw_text(draw, (x_date_sign, y_date_sign), [
        (date_sign, font_color_rgb,
         font_path, font_size, 'la'),
    ])

    # add sign name on the picture
    sign_name_rus = image_param_horoscope["sign_names"][sign_name_eng]["sign_name_rus"]

    x_sign_name_rus_sign, y_sign_name_rus_sign = image_param_horoscope["image_config"]["x_sign_name_rus_sign"], \
                                                 image_param_horoscope["image_config"]["y_sign_name_rus_sign"]

    font_path = image_param_horoscope['sign_name_rus_font_path']
    font_color_hex = image_param_horoscope["image_config"]["sign_name_rus_color"]
    font_color_rgb = ImageColor.getcolor(font_color_hex, "RGB")
    font_size = image_param_horoscope["image_config"]["sign_name_rus_font_size"]

    draw_text(draw, (x_sign_name_rus_sign, y_sign_name_rus_sign), [
        (sign_name_rus, font_color_rgb,
         font_path, font_size, 'la'),
    ])

    # add sign symbol on the picture
    sign_emoji = image_param_horoscope["sign_names"][sign_name_eng]["sign_emoji"]

    x_sign_emoji, y_sign_emoji = image_param_horoscope["image_config"]["x_sign_emoji"], \
                                 image_param_horoscope["image_config"]["y_sign_emoji"]

    font_path = image_param_horoscope['sign_emoji_font_path']
    font_color_hex = image_param_horoscope["image_config"]["sign_emoji_color"]
    font_color_rgb = ImageColor.getcolor(font_color_hex, "RGB")
    font_size = image_param_horoscope["image_config"]["sign_emoji_font_size"]

    draw_text(draw, (x_sign_emoji, y_sign_emoji), [
        (sign_emoji, font_color_rgb,
         font_path, font_size, 'la'),
    ])

    with io.BytesIO() as output:
        image.save(output, format="PNG", optimize=True, quality=10)
        bytestring = output.getvalue()

    return bytestring
