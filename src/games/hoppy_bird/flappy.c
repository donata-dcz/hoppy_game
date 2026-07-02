/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** flappy.c
*/

#include <gb/gb.h>
#include "flappy.h"
#include "font_utils.h"
#include "sprites/flappy_bg_tiles.h"
#include "sprites/flappy_bird.h"
#include "sprites/pipe_tiles.h"
#include "sprites/grass_tiles.h"
#include "hoppy_game.h"

flappy_t *flappy_get_state(void)
{
    static flappy_t state;

    return &state;
}

static void draw_score(uint8_t score)
{
    uint8_t tiles[3];

    tiles[0] = get_char_tile('0' + score / 100);
    tiles[1] = get_char_tile('0' + (score / 10) % 10);
    tiles[2] = get_char_tile('0' + score % 10);
    set_win_tiles(0, 0, 3, 1, tiles);
}

static void init_gfx(void)
{
    LCDC_REG = LCDCF_BG8000 | LCDCF_WIN9C00;
    set_bkg_data(T_SKY, FLAPPY_BG_TILES_COUNT, flappy_bg_tiles);
    BGP_REG = 0xE4;
    OBP0_REG = 0xE4;
    fill_bkg_rect(0, 0, 32, GROUND_ROW, T_SKY);
    fill_bkg_rect(0, GROUND_ROW, 32, 2, T_GROUND);
    menu_font_load();
    SPRITES_8x16;
    set_sprite_data(S_BIRD, FLAPPY_BIRD_TILES_COUNT, FlappyBirdTiles);
    set_bkg_data(T_GROUND, 1, GrassTiles);
    set_bkg_data(T_PIPE_CAP, 1, PipeHeadTiles);
    set_bkg_data(T_PIPE_BODY, 1, PipeTailTiles);
    set_bkg_data(T_PIPE_CAP_FLIP, 1, PipeHeadFlippedTiles);
    set_sprite_tile(SPR_BIRD, S_BIRD);
    set_sprite_tile(SPR_BIRD_R, S_BIRD + 2);
    move_sprite(SPR_BIRD, BIRD_X + 8, flappy_get_state()->bird_y + 16);
    move_sprite(SPR_BIRD_R, BIRD_X + 16, flappy_get_state()->bird_y + 16);
    SHOW_BKG;
    SHOW_SPRITES;
}

static void animate_bird(void)
{
    flappy_t *state = flappy_get_state();
    uint8_t frame = (state->tick >> 2) & 1;

    if (state->bird_vy < 0)
        frame = 1;
    if (frame == 0) {
        set_sprite_tile(SPR_BIRD, S_BIRD);
        set_sprite_tile(SPR_BIRD_R, S_BIRD + 2);
    } else {
        set_sprite_tile(SPR_BIRD, S_BIRD + 4);
        set_sprite_tile(SPR_BIRD_R, S_BIRD + 6);
    }
    state->tick++;
}

static void setup_score_win(void)
{
    fill_win_rect(0, 0, 20, 1, 0);
    WX_REG = 7;
    WY_REG = 136;
    SHOW_WIN;
}

static void flappy_handle_input(void)
{
    if (joypad() & J_A)
        flappy_get_state()->bird_vy = -FLAPPY_JUMP_FORCE;
}

static void apply_gravity(void)
{
    flappy_t *s = flappy_get_state();
    int16_t new_y = (int16_t)s->bird_y + s->bird_vy;

    s->bird_vy += FLAPPY_GRAVITY;
    if (s->bird_vy > FLAPPY_MAX_FALL)
        s->bird_vy = FLAPPY_MAX_FALL;
    if (new_y < 0)
        new_y = 0;
    if (new_y >= FLAPPY_GROUND_Y)
        new_y = FLAPPY_GROUND_Y;
    s->bird_y = (uint8_t)new_y;
    move_sprite(SPR_BIRD, BIRD_X + 8, s->bird_y + 16);
    move_sprite(SPR_BIRD_R, BIRD_X + 16, s->bird_y + 16);
}

static uint8_t check_collision(void)
{
    flappy_t *s = flappy_get_state();

    if (s->bird_y >= FLAPPY_GROUND_Y)
        return 1;
    return pipe_hit_check(s->bird_y);
}

void flappy_init(void)
{
    flappy_get_state()->bird_y = BIRD_INIT_Y;
    flappy_get_state()->bird_vy = 0;
    flappy_get_state()->ready = 0;
    flappy_get_state()->score = 0;
    flappy_get_state()->tick = 0;
    DISPLAY_OFF;
    clear_all_sprites();
    init_gfx();
    setup_score_win();
    DISPLAY_ON;
    init_pipes();
    draw_score(0);
    draw_text(7, 5, "PRESS A");
}

uint8_t flappy_update(void)
{
    flappy_t *s = flappy_get_state();

    if (!s->ready) {
        if (joypad() & J_A) {
            fill_bkg_rect(7, 5, 7, 1, T_SKY);
            s->ready = 1;
        }
        return 0;
    }
    update_pipes();
    flappy_handle_input();
    apply_gravity();
    animate_bird();
    if (pipe_score_check()) {
        s->score++;
        draw_score(s->score);
    }
    return check_collision();
}
