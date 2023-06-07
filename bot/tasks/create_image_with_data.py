import functools
import io
import json
import logging
from io import BytesIO
from typing import Any

from PIL import Image, ImageDraw
from cairosvg import svg2png

from bot.functions.draw_text import draw_text
from bot.kerykeion import (KrInstance, MakeSvgInstance,
                           NatalAspects)
from bot.logic.enums import PlanetEnums
from bot.tasks.read_config import image_param_natal

logger = logging.getLogger(__name__)

BROWN = (67, 57, 49)
WHITE = (255, 255, 255)
YELLOW = (244, 183, 92)

def convert_decimal_to_degrees(dec):

    dec = float(dec)
    degrees = int(dec)
    degrees_new = (dec - float(degrees)) * 60.0
    minutes = int(degrees_new)
    seconds = int(round((degrees_new - float(minutes)) * 60.0))

    out = (
        f'{degrees:{"03d" if degrees < 0 else "02d"}}° '
        f'{minutes:{"03d" if minutes < 0 else "02d"}}\' '
        f'{seconds:{"03d" if seconds < 0 else "02d"}}"')

    return str(out)


@functools.lru_cache()
def open_image(filename):
    image = Image.open(filename)

    return image


def place_natal_circle_and_watermark(
        image_param: dict[str, Any],
        natal_circle_svg: bytearray,
        file_paths: dict[str, Any]
):

    place_natal_circle_and_watermark_vars = image_param["place_natal_circle_and_watermark_vars"]

    io_buffer = svg2png(bytestring=natal_circle_svg, scale=2.0)

    background_image = open_image(file_paths["background_image_natal_path"])

    background_image_width = place_natal_circle_and_watermark_vars[0]['background_image_width_natal']
    background_image_height = place_natal_circle_and_watermark_vars[0]['background_image_height_natal']

    natal_circle_margin_top_ratio = place_natal_circle_and_watermark_vars[1]['natal_circle_margin_top_ratio_natal']

    natal_circle_resize_ratio = place_natal_circle_and_watermark_vars[2]['natal_circle_resize_ratio_natal']

    background_image = background_image.resize(
        (background_image_width, background_image_height),
        Image.Resampling.LANCZOS)

    natal_circle = Image.open(BytesIO(io_buffer))

    natal_circle_width, natal_circle_height = natal_circle.size

    natal_circle_margin_top = int(round(background_image.width * natal_circle_margin_top_ratio))
    natal_circle_margin_left = -20

    left_center_position = (natal_circle_margin_left, natal_circle_margin_top)

    resized_natal_circle = natal_circle.resize((
        int((background_image_height / background_image_width) * natal_circle_width * natal_circle_resize_ratio),
        int((background_image_height / background_image_width) * natal_circle_height * natal_circle_resize_ratio)))

    background_image.paste(resized_natal_circle, left_center_position, resized_natal_circle)

    return background_image


def draw_input_birth_info(
        coordinates_and_font_settings: dict[str, Any],
        image_draw: ImageDraw,
        user_instance_json: dict[str, Any],
        file_paths: dict[str, Any]
):

    x_place_of_birth = coordinates_and_font_settings['x_place_of_birth']
    y_place_of_birth = coordinates_and_font_settings['y_place_of_birth']
    font_size_place_of_birth = coordinates_and_font_settings['font_size_place_of_birth']

    x_date_of_birth = coordinates_and_font_settings['x_date_of_birth']
    y_date_of_birth = coordinates_and_font_settings['y_date_of_birth']
    font_size_date_of_birth = coordinates_and_font_settings['font_size_date_of_birth']

    x_time_of_birth = coordinates_and_font_settings['x_time_of_birth']
    y_time_of_birth = coordinates_and_font_settings['y_time_of_birth']
    font_size_time_of_birth = coordinates_and_font_settings['font_size_time_of_birth']

    first_user_place_of_birth = user_instance_json['city']

    draw_text(image_draw, (x_place_of_birth, y_place_of_birth), [
        (first_user_place_of_birth, WHITE,
         file_paths["text_font_path"], font_size_place_of_birth, 'rs'),
    ])

    month_list = ["января", "февраля", "марта",
                  "апреля", "мая", "июня",
                  "июля", "августа", "сентября",
                  "октября", "ноября", "декабря"]

    current_month_rus = month_list[user_instance_json["month"] - 1]
    first_user_date_of_birth = f'{user_instance_json["day"]:{"02d"}} {current_month_rus} {user_instance_json["year"]:{"04d"}}'

    draw_text(image_draw, (x_date_of_birth, y_date_of_birth), [
        (first_user_date_of_birth, WHITE,
         file_paths["text_font_path"], font_size_date_of_birth, 'rs'),
    ])

    first_user_time_of_birth = str(f'{user_instance_json["hour"]:{"02d"}}') + ':' + str(
        f'{user_instance_json["minute"]:{"02d"}}')

    draw_text(image_draw, (x_time_of_birth, y_time_of_birth), [
        (first_user_time_of_birth, WHITE,
         file_paths["text_font_path"], font_size_time_of_birth, 'rs'),
    ])


def draw_user_names(
        coordinates_and_font_settings: dict[str, Any],
        image_draw: ImageDraw,
        user_instance_json: dict[str, Any],
        file_paths: dict[str, Any]
):

    x = coordinates_and_font_settings['x']
    y = coordinates_and_font_settings['y']
    font_size = coordinates_and_font_settings['font_size']

    user_names = user_instance_json['name']

    draw_text(image_draw, (x, y), [
        (user_names, YELLOW,
         file_paths["text_font_path"], font_size, 'rs'),
    ])


def draw_planets_and_houses(
        coordinates_and_font_settings: dict[str, Any],
        image_draw: ImageDraw,
        user_instance_json: dict[str, Any],
        image_param: dict[str, Any],
        file_paths: dict[str, Any]
):

    x = coordinates_and_font_settings['x']
    y = coordinates_and_font_settings['y']
    font_size = coordinates_and_font_settings['font_size']

    planets_info = image_param["planets_info"]
    houses_info = image_param["houses_info"]
    draw_user_info_vars = image_param["draw_user_info_vars"]

    y_coord_start = y

    for planet_num in range(len(planets_info)):

        x -= font_size * draw_user_info_vars[0]['x_text_clearance_coef']

        if user_instance_json[planets_info[planet_num]['name']]['retrograde']:
            draw_text(image_draw, (x, y), [
                (user_instance_json[planets_info[planet_num]['name']]['name_rus'] + ' ',
                 WHITE, file_paths["text_font_path"], font_size, 'la'),
                (user_instance_json[planets_info[planet_num]['name']]['sign_symbol'] + ' ',
                 WHITE, file_paths["symbols_font_path"], font_size, 'la'),
                ('R' + ' ', WHITE,
                 file_paths["symbols_font_path"], font_size, 'la'),
            ]),

        else:
            draw_text(image_draw, (x, y), [
                (user_instance_json[planets_info[planet_num]['name']]['name_rus'] + ' ',
                 WHITE, file_paths["text_font_path"], font_size, 'la'),
                (user_instance_json[planets_info[planet_num]['name']]['sign_symbol'] + ' ',
                 WHITE, file_paths["symbols_font_path"], font_size, 'la'),
            ]),

        x += font_size * draw_user_info_vars[0]['x_text_clearance_coef']

        x += 175
        y += 35
        draw_text(image_draw, (x, y), [
            (str(convert_decimal_to_degrees(user_instance_json[planets_info[planet_num]['name']]['position'])) +
             ' ', BROWN, file_paths["text_font_path"], font_size, 'rs'),
        ]),
        x -= 175
        y -= 35

        y += draw_user_info_vars[0]['y_text_clearance_coef']

    y = y_coord_start
    x += font_size * draw_user_info_vars[0]['planets_to_houses_clearance_coef_natal']

    x_coord_start = x

    for house_num in range(len(houses_info)):
        x = x_coord_start

        draw_text(image_draw, (x, y), [
            (f'{house_num + 1} дом ', WHITE,
             file_paths["text_font_path"], font_size, 'la'),
            (user_instance_json[houses_info[house_num]['name']]['sign_symbol'] + ' ',
             WHITE, file_paths["symbols_font_path"], font_size, 'la'),
        ]),

        x += font_size * 5.45

        x += 190
        y += 35
        draw_text(image_draw, (x, y), [
            (str(convert_decimal_to_degrees(user_instance_json[houses_info[house_num]['name']]['position'])),
             BROWN, file_paths["text_font_path"], font_size, 'rs'),
        ]),
        x -= 190
        y -= 35

        y += draw_user_info_vars[0]['y_text_clearance_coef']


def draw_natal_aspects(
        coordinates_and_font_settings: dict[str, Any],
        image_draw: ImageDraw,
        user_instance: KrInstance,
        image_param: dict[str, Any],
        file_paths: dict[str, Any]
):

    x = coordinates_and_font_settings['x']
    y = coordinates_and_font_settings['y']
    font_size = coordinates_and_font_settings['font_size']

    # planets_info = image_param["planets_info"]
    draw_natal_aspects_vars = image_param["draw_natal_aspects_vars"]

    # line_width = draw_natal_aspects_vars[0]['line_width']
    # line_color = draw_natal_aspects_vars[0]['line_color']
    square_size = draw_natal_aspects_vars[0]['square_size']

    x_coord_start = x
    # y_coord_start = y

    num_of_columns_and_rows = 10

    for row in range(num_of_columns_and_rows, 0, -1):
        x = x_coord_start
        y -= square_size

        num_of_columns_and_rows = num_of_columns_and_rows - 1

    natal_aspects_instance = NatalAspects(
        user_instance, new_settings_file=file_paths["symbols_and_names_json_path"])

    aspects_list = natal_aspects_instance.get_relevant_aspects()

    y_coord_start = y - square_size / 5

    for ascpect in aspects_list:
        planet1_catch_flag = False
        planet2_catch_flag = False

        for planet in PlanetEnums:
            planet_name = planet.name
            planet_value = planet.value

            # getting X coordinate (column)
            if ascpect['p1_name'] == planet_name:
                x = x_coord_start - square_size * planet_value + 25
                planet1_catch_flag = True

            # getting Y coordinate (row)
            if ascpect['p2_name'] == planet_name:
                y = y_coord_start + square_size * planet_value + 30
                planet2_catch_flag = True
            # fontsize = 80, +9 margin

            if planet1_catch_flag == True and planet2_catch_flag == True:
                draw_text(image_draw, (x, y), [
                    (ascpect['aspectSymbol'],
                     WHITE, file_paths["symbols_font_path"], font_size, 'la'),
                ]),


def draw_data(
        image_draw: ImageDraw,
        user_instance: KrInstance,
        user_instance_json: dict[str, Any],
        image_param: dict[str, Any],
        file_paths: dict[str, Any]
):

    coordinates_and_font_sizes = image_param["coordinates_and_font_sizes"]

    x = coordinates_and_font_sizes[0]['x']
    y = coordinates_and_font_sizes[0]['y']

    font_size = coordinates_and_font_sizes[0]['font_size_natal']

    coordinates_and_font_settings = {
        "x": x,
        "y": y,
        "font_size": font_size
    }

    draw_user_names(coordinates_and_font_settings, image_draw,
                    user_instance_json, file_paths)

    x_place_of_birth = coordinates_and_font_sizes[1]['x_natal_place_of_birth']
    y_place_of_birth = coordinates_and_font_sizes[1]['y_natal_place_of_birth']
    font_size_place_of_birth = coordinates_and_font_sizes[1]['font_size_natal_place_of_birth']

    x_date_of_birth = coordinates_and_font_sizes[1]['x_natal_date_of_birth']
    y_date_of_birth = coordinates_and_font_sizes[1]['y_natal_date_of_birth']
    font_size_date_of_birth = coordinates_and_font_sizes[1]['font_size_natal_date_of_birth']

    x_time_of_birth = coordinates_and_font_sizes[1]['x_natal_time_of_birth']
    y_time_of_birth = coordinates_and_font_sizes[1]['y_natal_time_of_birth']
    font_size_time_of_birth = coordinates_and_font_sizes[1]['font_size_natal_time_of_birth']

    coordinates_and_font_settings = {
        "x_place_of_birth": x_place_of_birth,
        "y_place_of_birth": y_place_of_birth,
        "font_size_place_of_birth": font_size_place_of_birth,

        "x_date_of_birth": x_date_of_birth,
        "y_date_of_birth": y_date_of_birth,
        "font_size_date_of_birth": font_size_date_of_birth,

        "x_time_of_birth": x_time_of_birth,
        "y_time_of_birth": y_time_of_birth,
        "font_size_time_of_birth": font_size_time_of_birth
    }

    draw_input_birth_info(coordinates_and_font_settings, image_draw,
                          user_instance_json, file_paths)

    x = coordinates_and_font_sizes[2]['x_natal']
    y = coordinates_and_font_sizes[2]['y_natal']
    font_size = coordinates_and_font_sizes[2]['font_size_natal']

    coordinates_and_font_settings = {
        "x": x,
        "y": y,
        "font_size": font_size
    }

    draw_planets_and_houses(coordinates_and_font_settings, image_draw,
                            user_instance_json, image_param, file_paths)

    x = coordinates_and_font_sizes[4]['x_natal']
    y = coordinates_and_font_sizes[4]['y_natal']
    font_size = coordinates_and_font_sizes[4]['font_size_natal']

    coordinates_and_font_settings = {
        "x": x,
        "y": y,
        "font_size": font_size
    }

    draw_natal_aspects(coordinates_and_font_settings,
                       image_draw, user_instance, image_param, file_paths)


def create_image_and_draw_data(
        natal_circle_svg: bytearray,
        file_paths: dict[str, Any],
        user_instance: KrInstance,
        user_instance_json: dict[str, Any],
        image_param: dict[str, Any]
):

    background_image = place_natal_circle_and_watermark(image_param, natal_circle_svg, file_paths)

    image_draw = ImageDraw.Draw(background_image)

    draw_data(image_draw, user_instance, user_instance_json, image_param, file_paths)

    background_image_rgb = background_image.convert('RGB')

    with io.BytesIO() as output:
        background_image_rgb.save(
            output, format="JPEG", optimize=True, quality=100)
        bytestring = output.getvalue()

    logger.debug(f'Natal image is done!')

    return bytestring


def draw_image(
        user_input_data: dict[str, Any],
        file_paths: dict[str, Any]
):

    user_instance = KrInstance(user_input_data["user_name"],
                               user_input_data["user_year"],
                               user_input_data["user_month"],
                               user_input_data["user_day"],
                               user_input_data["user_hour"],
                               user_input_data["user_minute"],
                               user_input_data["user_city"])

    svg_instance = MakeSvgInstance(user_instance)

    aspects_list = svg_instance.aspects_list
    houses_list = svg_instance.houses_list

    natal_circle_svg = svg_instance.returnSVG()

    try:
        user_instance_json = json.loads(user_instance.json(False))

        output_image = create_image_and_draw_data(natal_circle_svg, file_paths,
                                                  user_instance, user_instance_json, image_param_natal)

        return output_image, aspects_list, houses_list, user_instance_json

    except ValueError:
        print("JSON Error")
