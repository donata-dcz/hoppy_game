/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** score.c
*/

#include "font_utils.h"
#include "hoppy_game.h"

void draw_hoppy_score(uint16_t score)
{
    uint8_t tiles[3];

    if (score > 999)
        score = 999;
    tiles[0] = get_char_tile('0' + (score / 100) % 10);
    tiles[1] = get_char_tile('0' + (score / 10) % 10);
    tiles[2] = get_char_tile('0' + score % 10);
    set_win_tiles(0, 0, 3, 1, tiles);
}

void setup_score_window(void)
{
    fill_win_rect(0, 0, 20, 1, 0);
    WX_REG = 7;
    WY_REG = 136;
    SHOW_WIN;
}
