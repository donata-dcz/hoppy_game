/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** flappy_pipe.c
*/

#include <gb/gb.h>
#include "flappy.h"

static pipe_state_t *pipe_get_state(void)
{
    static pipe_state_t state;

    return &state;
}

static uint8_t lcg_next(pipe_state_t *s)
{
    s->rng = s->rng * 109 + 89;
    return s->rng;
}

static void fill_sky_col(uint8_t col)
{
    fill_bkg_rect(col, 0, 1, GROUND_ROW, T_SKY);
}

static void fill_pipe_col(uint8_t col)
{
    pipe_state_t *s = pipe_get_state();
    uint8_t bot = GROUND_ROW - s->cur_gap_y - PIPE_GAP;

    if (s->cur_gap_y > 0)
        fill_bkg_rect(col, 0, 1, s->cur_gap_y, T_PIPE_BODY);
    if (s->cur_gap_y > 0)
        fill_bkg_rect(col, s->cur_gap_y - 1, 1, 1, T_PIPE_CAP_FLIP);
    fill_bkg_rect(col, s->cur_gap_y, 1, PIPE_GAP, T_SKY);
    if (bot > 0) {
        fill_bkg_rect(col, s->cur_gap_y + PIPE_GAP, 1, 1, T_PIPE_CAP);
        if (bot > 1)
            fill_bkg_rect(col, s->cur_gap_y + PIPE_GAP + 1,
                1, bot - 1, T_PIPE_BODY);
    }
}

static void advance_column(void)
{
    pipe_state_t *s = pipe_get_state();
    uint8_t bg_col = ((s->scroll_x >> 3) + 21) & 31;

    if (s->pipe_phase == PIPE_SPACING) {
        s->cur_gap_y = lcg_next(s) % (PIPE_MAX_GAP_Y - PIPE_MIN_GAP_Y + 1)
            + PIPE_MIN_GAP_Y;
        s->pipe_screen_x = 168;
        s->scored = 0;
    }
    if (s->pipe_phase >= PIPE_SPACING)
        fill_pipe_col(bg_col);
    else
        fill_sky_col(bg_col);
    s->pipe_phase++;
    if (s->pipe_phase >= PIPE_WIDTH + PIPE_SPACING)
        s->pipe_phase = 0;
}

void init_pipes(void)
{
    pipe_state_t *s = pipe_get_state();

    s->scroll_x = 0;
    s->pipe_phase = PIPE_SPACING - 9;
    s->cur_gap_y = PIPE_MIN_GAP_Y + 3;
    s->pipe_screen_x = 200;
    s->scored = 0;
    s->rng = DIV_REG;
    SCX_REG = 0;
}

void update_pipes(void)
{
    pipe_state_t *s = pipe_get_state();

    s->scroll_x++;
    SCX_REG = s->scroll_x;
    s->pipe_screen_x--;
    if ((s->scroll_x & 7) == 0)
        advance_column();
}

uint8_t pipe_hit_check(uint8_t bird_y)
{
    pipe_state_t *s = pipe_get_state();
    uint8_t row_t = (bird_y + 2) >> 3;
    uint8_t row_b = (bird_y + 13) >> 3;

    if (s->pipe_screen_x > BIRD_X + 13)
        return 0;
    if (s->pipe_screen_x + PIPE_WIDTH * 8 <= BIRD_X + 2)
        return 0;
    if (row_t < s->cur_gap_y || row_b > s->cur_gap_y + PIPE_GAP - 1)
        return 1;
    return 0;
}

uint8_t pipe_score_check(void)
{
    pipe_state_t *s = pipe_get_state();

    if (s->scored)
        return 0;
    if (s->pipe_screen_x + PIPE_WIDTH * 8 < BIRD_X) {
        s->scored = 1;
        return 1;
    }
    return 0;
}
