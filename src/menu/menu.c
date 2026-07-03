/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** menu.c
*/

#include "snake_game_loop.h"
#include "font_utils.h"
#include "hoppy_game.h"
#include "hoppy_menu.h"
#include "end_game.h"
#include "flappy.h"
#include "saved_data.h"

void draw_menu(uint8_t selected)
{
    const char *menu_labels[] = {
        "HOPPY SNAKE", "HOPPY BIRD", "HOPPY RUN"
    };
    uint8_t empty = 0;

    for (uint8_t y = 0; y < 18; y++)
        for (uint8_t x = 0; x < 20; x++)
            set_bkg_tiles(x, y, 1, 1, &empty);
    draw_text(5, 5, "SELECT GAME");
    for (uint8_t i = 0; i < MENU_ITEMS; i++) {
        if (i == selected)
            draw_text(3, 8 + i * 2, ">");
        else
            draw_text(3, 8 + i * 2, " ");
        draw_text(5, 8 + i * 2, menu_labels[i]);
    }
}

void handle_menu_input(uint8_t *selected, uint8_t keys, uint8_t prev_keys)
{
    uint8_t pressed = keys & ~prev_keys;

    if (pressed & J_DOWN) {
        *selected = (*selected + 1) % MENU_ITEMS;
        draw_menu(*selected);
    }
    if (pressed & J_UP) {
        *selected = (*selected + MENU_ITEMS - 1) % MENU_ITEMS;
        draw_menu(*selected);
    }
}

void launch_selected_game(uint8_t selected)
{
    menu_t game_labels[] = {
        {HOPPY_SNAKE, run_snake}, {HOPPY_BIRD, run_flappy},
        {HOPPY_RUN, run_hoppy}, {0, NULL}
    };

    clear_all_sprites();
    for (uint32_t i = 0; game_labels[i].func != NULL; i++) {
        if ((int)selected == game_labels[i].id) {
            checkerboard_wipe_transition();
            clear_all_sprites();
            game_labels[i].func();
            break;
        }
    }
}

static bool flappy_play_round(void)
{
    uint8_t saved_lcdc = LCDC_REG;
    bool result;

    flappy_init();
    while (1) {
        vsync();
        if (flappy_update())
            break;
    }
    DISPLAY_OFF;
    LCDC_REG = saved_lcdc;
    DISPLAY_ON;
    result = game_over_screen(GAME_FLAPPY, flappy_get_state()->score, hoppy_name);
    return result;
}

void run_flappy(void)
{
    while (flappy_play_round());
}

void run_snake(void)
{
    uint8_t score;

    while (1) {
        score = snake_game_loop();
        if (!game_over_screen(GAME_SNAKE, score, hoppy_name))
            return;
    }
}
