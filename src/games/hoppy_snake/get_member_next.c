/*
** EPITECH PROJECT, 2026
** get_member_next.c
** File description:
** get_member_next
*/

#include "snake_game_t.h" // snake_game_t
#include "tile_data_t.h" // tile_data_t
#include "epitech_utils.h" // macros
#include "snake_board_t.h" // get_coords_next

tile_data_t *get_member_next(snake_game_t *snake_game, coords_t coords)
{
    coords_t next_coords = coords;

    if (get_coords_next(&(snake_game->board), &next_coords) == FAILURE)
        return NULL;
    return get_tile_at(&(snake_game->board), next_coords);
}
