/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** manage_input.c
*/

#include "hoppy_game.h"
#include <rand.h>
#include <stdint.h>
#include <string.h>

void handle_input(input_t *input)
{
    input->keys = joypad();
    if ((input->keys & J_A || input->keys & J_UP) && !input->is_jumping) {
        input->is_jumping = true;
        input->jump_level -= JUMP_FORCE;
        input->hover_timer = HOVER_FRAMES;
    }
}

void handle_jump(input_t *input)
{
    input->jump_level += GRAVITY;
    if (input->jump_level >= 0 && input->hover_timer > 0) {
        input->hover_timer--;
        input->jump_level = 0;
    }
    input->cat_y += input->jump_level;
    if (input->cat_y >= GROUND_Y) {
        input->cat_y = GROUND_Y;
        input->is_jumping = false;
        input->jump_level = 0;
        input->hover_timer = 0;
    }
    move_sprite(0, CAT_X, (uint8_t)input->cat_y);
    move_sprite(1, CAT_X + 8, (uint8_t)input->cat_y);
}

void handle_run(display_t *display)
{
    display->counter++;
    if (display->counter >= ANIM_SPEED) {
        display->counter = 0;
        display->frame = (display->frame + 1) % 3;
        set_sprite_tile(0, display->frame * 4);
        set_sprite_tile(1, display->frame * 4 + 2);
    }
}

void update_pipe(pipe_t *pipe, display_t *display)
{
    int16_t screen_x;

    if (!pipe->active) {
        pipe->world_x = display->scroll + PIPE_SPAWN_X;
        pipe->col = (pipe->world_x >> 3) & 0x1F;
        pipe->height = PIPE_HEIGHT_MIN +
            (rand() % (PIPE_HEIGHT_MAX - PIPE_HEIGHT_MIN + 1));
        pipe->active = true;
    }
    screen_x = (int16_t)pipe->world_x - (int16_t)display->scroll;
    if (screen_x < -8) {
        draw_pipe_at(pipe->col, pipe->height, true);
        pipe->active = false;
        return;
    }
    draw_pipe_at(pipe->col, pipe->height, false);
}

bool handle_collisions(pipe_t *pipe, input_t *input, display_t *display)
{
    int16_t cat_left = (int16_t)CAT_X + 4;
    int16_t cat_right = (int16_t)CAT_X + 12;
    int16_t screen_x = 0;
    int16_t pipe_left = 0;
    int16_t pipe_right = 0;
    int16_t pipe_top_y = 0;
    int16_t cat_bottom = 0;

    if (!pipe->active)
        return false;
    screen_x = (int16_t)pipe->world_x - (int16_t)display->scroll;
    pipe_left = screen_x + 1;
    pipe_right = screen_x + 7;
    if (pipe_right > cat_left && pipe_left < cat_right) {
        pipe_top_y = ((int16_t)(PIPE_BASE_ROW - pipe->height + 1) * 8) + 16;
        cat_bottom = (int16_t)input->cat_y + 14;
        if (cat_bottom > pipe_top_y)
            return true;
    }
    return false;
}
