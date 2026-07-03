/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** end_game.c
*/

#include "hoppy_game.h"
#include "hoppy_menu.h"
#include "empty_tiles.h"
#include "sprites/checkerboard.h"
#include "saved_data.h"
#include "font_utils.h"

static bool handle_keys_menu(void)
{
    uint8_t keys = 0;

    while (joypad())
        vsync();
    while (1) {
        vsync();
        keys = joypad();
        if (keys & J_START)
            return true;
        if (keys & J_SELECT)
            return false;
    }
}

static void print_game_score(uint8_t id)
{
    if (id == GAME_SNAKE)
        draw_text(5, 2, "HOPPY SNAKE");
    else if (id == GAME_FLAPPY)
        draw_text(5, 2, "HOPPY BIRD");
    else
        draw_text(6, 2, "HOPPY RUN");
}

static void draw_current_score(score_t *scores, uint8_t selected)
{
    char str[4];
    uint8_t i;
    uint16_t score;

    for (i = 0; i < MAX_SCORES; i++) {
        score = scores[i].score;
        str[0] = '0' + (score / 100) % 10;
        str[1] = '0' + (score / 10) % 10;
        str[2] = '0' + score % 10;
        str[3] = '\0';
        //draw_text(2, 7 + i * 2, (i == selected) ? ">" : " ");
        draw_text(5, 7 + i * 2, scores[i].name);
        draw_text(12, 7 + i * 2, str);
    }
}

static bool draw_leaderboard(uint8_t id, uint16_t score)
{
    score_t scores[MAX_SCORES];
    uint8_t selected = MAX_SCORES;
    
    init_bkg(0);
    load_scores(id, scores);
    print_game_score(id);
    draw_text(5, 4, "BEST SCORES");
    for (int8_t i = MAX_SCORES - 1; i >= 0; i--) {
        if (scores[i].score == score) {
            selected = i;
            break;
        }
    }
    draw_current_score(scores, selected);
    return handle_keys_menu();
}

bool game_over_screen(uint8_t id, uint16_t score, char *hoppy_name)
{
    uint8_t keys = 0;

    SCX_REG = 0;
    HIDE_SPRITES;
    menu_font_load();
    init_bkg(0);
    draw_text(5, 7, "GAME OVER");
    draw_text(4, 9, "PRESS START");
    save_score(id, score, hoppy_name);
    while (1) {
        vsync();
        keys = joypad();
        if (keys & J_START)
            return true;
        if (keys & J_SELECT)
            return draw_leaderboard(id, score);
    }
}

static void show_menu(uint8_t selected)
{
    menu_font_load();
    SHOW_BKG;
    SCX_REG = 0;
    draw_menu(selected);
}

void run_hoppy_game(void)
{
    uint8_t selected = 0;
    uint8_t prev_keys = 0xFF;
    uint8_t keys = 0;

    init_menu(selected);
    while (1) {
        vsync();
        keys = joypad();
        handle_menu_input(&selected, keys, prev_keys);
        if ((keys & ~prev_keys) & J_A) {
            launch_selected_game(selected);
            show_menu(selected);
        }
        prev_keys = keys;
    }
}

void checkerboard_wipe_transition(void)
{
    uint8_t checker_tile = 3;

    set_bkg_data(3, 1, CheckerBoardTiles);
    for (uint8_t x = 0; x < 20; x++) {
        for (uint8_t y = 0; y < 20; y++)
            set_bkg_tiles(x, y, 1, 1, &checker_tile);
        vsync();
    }
}

void clear_all_sprites(void)
{
    for (uint8_t i = 0; i < 40; i++) {
        move_sprite(i, 0, 144);
        set_sprite_tile(i, 0);
    }
    HIDE_SPRITES;
}
