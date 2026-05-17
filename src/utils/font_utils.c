/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** font_utils.c
*/

#include <gb/gb.h>
#include <stdint.h>
#include "font_utils.h"
#include "sprites/font_tiles.h"

void menu_font_load(void)
{
    set_bkg_data(FONT_TILE_OFFSET, FONT_TILE_COUNT, FontTiles);
}

uint8_t get_specific_tiles(char c)
{
    switch (c) {
        case '!':
            return FONT_OFFSET_SYMBOL + 0;
        case ':':
            return FONT_OFFSET_SYMBOL + 1;
        case '?':
            return FONT_OFFSET_SYMBOL + 2;
        case '.':
            return FONT_OFFSET_SYMBOL + 3;
        case '>':
            return FONT_TILE_OFFSET + 41;
        case ' ':
            return FONT_TILE_OFFSET;
        default:
            return FONT_TILE_OFFSET;
    }
}

uint8_t get_char_tile(char c)
{
    if (c >= 'A' && c <= 'Z')
        return FONT_OFFSET_ALPHA + (c - 'A');
    if (c >= 'a' && c <= 'z')
        return FONT_OFFSET_ALPHA + (c - 'a');
    if (c >= '0' && c <= '9')
        return FONT_OFFSET_DIGIT + (c - '0');
    return get_specific_tiles(c);
}

void draw_text(uint8_t col, uint8_t row, const char *text)
{
    uint8_t *vram = get_bkg_xy_addr(col, row);
    uint16_t i = 0;

    while (text[i] != '\0') {
        set_vram_byte(vram++, get_char_tile(text[i]));
        i++;
    }
}
