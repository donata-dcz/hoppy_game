/*
** EPITECH PROJECT, 2026
** get_coords_next.c
** File description:
** get_coords_next
*/

#include "snake_board_t.h" // snake_board_t
#include "epitech_utils.h" // SUCCESS, FAILURE
#include "tile_data_t.h" // tile_data_t
#include "coords_t.h" // coords_t

static int move_up(size_t *y)
{
    if (*y == 0)
        return FAILURE;
    --(*y);
    return SUCCESS;
}

static int move_left(size_t *x)
{
    if (*x == 0)
        return FAILURE;
    --(*x);
    return SUCCESS;
}

static int calculate_coords_increment(const tile_data_t *snake_tile,
    size_t *x, size_t *y)
{
    switch (*snake_tile) {
        case SNAKE_UP:
            return move_up(y);
        case SNAKE_DOWN:
            ++(*y);
            return SUCCESS;
        case SNAKE_LEFT:
            return move_left(x);
        case SNAKE_RIGHT:
            ++(*x);
            return SUCCESS;
        default:
            return FAILURE;
    }
}

int get_coords_next(snake_board_t *snake_board, coords_t *coords)
{
    const tile_data_t *snake_tile = get_tile_at(snake_board, *coords);
    int snake_y = (int)coords->values[0];
    int snake_x = (int)coords->values[1];

    if (calculate_coords_increment(snake_tile, &snake_x, &snake_y) == FAILURE)
        return FAILURE;
    if (snake_tile == NULL)
        return FAILURE;
    coords->values[0] = (size_t)snake_y;
    coords->values[1] = (size_t)snake_x;
    return SUCCESS;
}
