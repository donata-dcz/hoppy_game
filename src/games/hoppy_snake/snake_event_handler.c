/*
** EPITECH PROJECT, 2026
** snake_key_handler.c
** File description:
** snake_key_handler
*/

#include "snake_game_t.h"
#include "snake_sprites_t.h" // get_head_sprite
#include "tile_data_t.h" // tile_data_t
#include "snake_key_handler.h"
#include <stdint.h>
#include <gb/gb.h>

void snake_key_handler(snake_game_t *snake_game, uint8_t key_input)
{
    tile_data_t *head_tile = get_tile_at(
        &(snake_game->board), snake_game->head_coords);

    move_sprite(get_head_sprite(*head_tile), 0, 0);
    if (key_input == J_UP && *head_tile != SNAKE_DOWN)
        *head_tile = SNAKE_UP;
    if (key_input == J_DOWN && *head_tile != SNAKE_UP)
        *head_tile = SNAKE_DOWN;
    if (key_input == J_LEFT && *head_tile != SNAKE_RIGHT)
        *head_tile = SNAKE_LEFT;
    if (key_input == J_RIGHT && *head_tile != SNAKE_LEFT)
        *head_tile = SNAKE_RIGHT;
    move_sprite(get_head_sprite(*head_tile),
        snake_game->head_coords.values[1],
        snake_game->head_coords.values[0]
    );
}
