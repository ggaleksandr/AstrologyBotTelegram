from PIL import ImageDraw, ImageFont


def draw_text(
        image: ImageDraw,
        coords: tuple[int, int],
        content: list[tuple[str, tuple[int, int, int], str, int, str]]
):
    fonts = {}

    for text, color, font_name, font_size, anchor in content:
        font = fonts.setdefault(font_name, ImageFont.truetype(font_name, font_size))
        image.text(coords, text, color, font, anchor)
        coords = (coords[0] + font.getsize(text)[0], coords[1])
