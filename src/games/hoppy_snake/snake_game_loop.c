/*
** EPITECH PROJECT, 2026
** snake_game_loop.c
** File description:
** snake_game_loop
*/

#include <stdbool.h>
#include <types.h>
#include <stddef.h>
#include <gb/gb.h>
#include "snake_game_t.h"
#include "epitech_utils.h"
#include "snake_key_handler.h"
#include "snake_game_data.h"
#include "snake_score.h" // increment_score
#include <stdint.h>

static uint8_t delay_and_get_event(size_t delay_size)
{
    uint8_t event = 0x00u;
    uint8_t last_key_pressed = 0x00u;

    for (; delay_size > 0; --delay_size) {
        event = joypad();
        if (event & SNAKE_KEYMASK)
            last_key_pressed = event;
    }
    return last_key_pressed;
}

uint8_t snake_game_loop(void)
{
    snake_game_t snake_game;
    snake_game_key_t game_event = NO_EVENT;
    uint8_t event = 0x00u;

    init_snake_game(&snake_game);
    while (game_event != GAME_OVER) {
        if (game_event == FISH_EATEN && place_fish(&snake_game) == FAILURE)
            return SUCCESS;
        if (game_event == FISH_EATEN) {
            snake_game.unflold++;
            increment_score(&(snake_game.score));
        }
        event = delay_and_get_event(SNAKE_FRAME_LENGTH);
        SHOW_BKG;
        vsync();
        snake_key_handler(&snake_game, event);
        game_event = snake_step(&snake_game);
    }
    return snake_game.score;
}
