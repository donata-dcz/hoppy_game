/*
** EPITECH PROJECT, 2026
** snake_score.c
** File description:
** snake_score
*/

#include "snake_sprites_t.h" // macros
#include "snake_game_data.h" // macros
#include "snake_score.h" // macros
#include <gb/gb.h> // uint8_t, get_bkg_xy_addr, set_vram_byte

static void show_score(char snake_score)
{
    uint8_t *vram = get_bkg_xy_addr(0 + SNAKE_SCORE_W - 1, BOARD_HEIGHT);
    char nth_digit = 0;

    for (char i = SNAKE_SCORE_W - 1; i >= 0; --i) {
        nth_digit = snake_score % 10;
        snake_score = snake_score / 10;
        set_vram_byte(vram--, SNAKE_BGSCORE_ASSET + nth_digit);
    }
}

void set_score(char *original_score, char new_score)
{
    *original_score = new_score;
    show_score(*original_score);
}

void init_snake_score(char *snake_score)
{
    uint8_t *vram = get_bkg_xy_addr(SNAKE_SCORE_W, BOARD_HEIGHT);

    set_score(snake_score, 0);
    for (char i = SNAKE_SCORE_W; i < BOARD_WIDTH; ++i)
        set_vram_byte(vram++, SNAKE_BGBACKGROUND_ASSET);
}

void increment_score(char *original_score)
{
    set_score(original_score, *original_score + 1);
}
