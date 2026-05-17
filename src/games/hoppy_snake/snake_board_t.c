/*
** EPITECH PROJECT, 2026
** snake_board_t.c
** File description:
** snake_board_t
*/

#include "snake_board_t.h" // snake_board_t
#include "tile_data_t.h" // tile_data_t

tile_data_t *get_tile_at(snake_board_t *snake_board, coords_t cds)
{
    if (
        (cds.values[0] >= BOARD_HEIGHT)
        || (cds.values[1] >= BOARD_WIDTH)
        ) {
        return NULL;
    }
    return &(
        (*snake_board)[
            cds.values[0] * BOARD_WIDTH
            + cds.values[1]
        ]
    );
}
