/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** hoppy_run.c
*/

#include "font_utils.h"
#include "hoppy_game.h"
#include "end_game.h"
#include "saved_data.h"

void handle_sprite_animation(display_t *display, input_t *input)
{
    if (input->is_jumping) {
        set_sprite_tile(0, 8);
        set_sprite_tile(1, 10);
    } else {
        handle_run(display);
    }
}

bool check_game_over(display_t *display)
{
    if (display->lives == 0) {
        HIDE_SPRITES;
        HIDE_WIN;
        return true;
    }
    return false;
}

void handle_collision_damage(pipe_t *pipe, input_t *input,
    display_t *display, uint8_t *invincible)
{
    if (*invincible > 0) {
        (*invincible)--;
        return;
    }
    if (handle_collisions(pipe, input, display)) {
        display->lives--;
        *invincible = 60;
        draw_lives(display->lives);
    }
}

static void update_scroll(display_t *display, uint8_t *increase)
{
    display->scroll++;
    if (display->scroll % (SPEED_INCREASE_INTERVAL * (*increase)) == 0) {
        display->speed++;
        (*increase)++;
    }
    display->scroll += (display->speed - 1);
    SCX_REG = display->scroll & 0xFF;
}

static void manage_game(display_t *display, input_t *input,
    loop_t *state)
{
    handle_input(input);
    handle_sprite_animation(display, input);
    if (input->is_jumping)
        handle_jump(input);
    update_scroll(display, &state->increase);
    draw_hoppy_score(display->scroll >> 6);
    update_pipe(&state->pipe, display);
    handle_collision_damage(&state->pipe, input, display, &state->invincible);
}

void manage_main_loop(display_t *display, input_t *input)
{
    loop_t state = {{0, 0, 0, false}, 0, 1};

    SHOW_BKG;
    SHOW_SPRITES;
    setup_score_window();
    draw_hoppy_score(0);
    while (1) {
        vsync();
        manage_game(display, input, &state);
        if (check_game_over(display))
            return;
    }
}

static display_t init_display(void)
{
    display_t display;

    display.scroll = 0;
    display.counter = 0;
    display.frame = 0;
    display.lives = MAX_LIVES;
    display.speed = 1;
    return display;
}

static input_t init_input(void)
{
    input_t input;

    input.keys = 0;
    input.jump_level = 0;
    input.is_jumping = false;
    input.cat_y = GROUND_Y;
    input.hover_timer = 0;
    return input;
}

void run_hoppy(void)
{
    display_t display;
    input_t input;
    uint16_t score = 0;

    while (1) {
        clear_all_sprites();
        display = init_display();
        input = init_input();
        display_background();
        display_pipe();
        display_hoppy(&input, MAX_LIVES);
        manage_main_loop(&display, &input);
        score = display.scroll >> 6;
        if (!game_over_screen(GAME_HOPPY, score, hoppy_name))
            return;
    }
}
