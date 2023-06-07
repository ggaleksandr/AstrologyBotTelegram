import json
import os

cwd_name = os.getcwd()

symbols_font_path = os.path.normpath(
os.path.join(cwd_name, "data/fonts/FreeSerif.ttf"))
text_font_path = os.path.normpath(
    os.path.join(cwd_name, "data/fonts/Montserrat-Bold.ttf"))
symbols_and_names_json_path = os.path.normpath(
    os.path.join(cwd_name, "bot/kerykeion/kr.config.json"))
image_param_natal_config_json_path = os.path.normpath(
    os.path.join(cwd_name, "bot/configs/image.config.json"))
background_image_natal_path = os.path.normpath(
    os.path.join(cwd_name, "data/graphics/Front_opt_clear.png"))
image_param_horoscope_config_json_path = os.path.normpath(
    os.path.join(cwd_name, "bot/configs/horoscope.config.json"))
background_image_horoscope_path = os.path.normpath(
    os.path.join(cwd_name, "data/graphics/Back_clear_opt.jpg"))

file_paths = {
    "symbols_font_path": symbols_font_path,
    "text_font_path": text_font_path,
    "symbols_and_names_json_path": symbols_and_names_json_path,
    "image_param_natal_config_json_path": image_param_natal_config_json_path,
    "background_image_natal_path": background_image_natal_path,
    "image_param_horoscope_config_json_path": image_param_horoscope_config_json_path,
    "background_image_horoscope_path": background_image_horoscope_path,
}

with open(file_paths["image_param_natal_config_json_path"], 'r', encoding="utf-8", errors='ignore') as f:
    image_param_natal_config_json = json.load(f)
    image_param_natal = {
        "planets_info": image_param_natal_config_json['planets'],
        "houses_info": image_param_natal_config_json['houses'],
        "coordinates_and_font_sizes": image_param_natal_config_json['coordinates_and_font_sizes'],
        "place_natal_circle_and_watermark_vars": image_param_natal_config_json['place_natal_circle_and_watermark_vars'],
        "draw_input_birth_info_vars": image_param_natal_config_json['draw_input_birth_info_vars'],
        "draw_user_info_vars": image_param_natal_config_json['draw_user_info_vars'],
        "draw_couple_aspects_info_vars": image_param_natal_config_json['draw_couple_aspects_info_vars'],
        "draw_natal_aspects_vars": image_param_natal_config_json['draw_natal_aspects_vars']
    }

with open(image_param_horoscope_config_json_path, 'r', encoding="utf-8", errors='ignore') as f:
    image_param_horoscope_config_json = json.load(f)
    image_param_horoscope = {
        "horoscope_type_names_rus": image_param_horoscope_config_json['horoscope_type_names_rus'],
        "sign_names": image_param_horoscope_config_json['sign_names'],
        "month_list": image_param_horoscope_config_json['month_list'],
        "image_config": image_param_horoscope_config_json['image_config'],
    }

image_param_horoscope['main_text_font_path'] = os.path.normpath(
    os.path.join(cwd_name, image_param_horoscope["image_config"]["main_text_font_path"]))
image_param_horoscope['horoscope_type_sign_font_path'] = os.path.normpath(
    os.path.join(cwd_name, image_param_horoscope["image_config"]["horoscope_type_sign_font_path"]))
image_param_horoscope['horoscope_date_sign_font_path'] = os.path.normpath(
    os.path.join(cwd_name, image_param_horoscope["image_config"]["horoscope_date_sign_font_path"]))
image_param_horoscope['sign_name_rus_font_path'] = os.path.normpath(
    os.path.join(cwd_name, image_param_horoscope["image_config"]["sign_name_rus_font_path"]))
image_param_horoscope['sign_emoji_font_path'] = os.path.normpath(
    os.path.join(cwd_name, image_param_horoscope["image_config"]["sign_emoji_font_path"]))
