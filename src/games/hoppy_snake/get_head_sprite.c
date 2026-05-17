/*
** EPITECH PROJECT, 2026
** get_head_sprite.c
** File description:
** get_head_sprite
*/

#include "snake_sprites_t.h" // snake_head_positions_t
#include "tile_data_t.h"

snake_head_positions_t get_head_sprite(tile_data_t direction)
{
    switch (direction) {
    case SNAKE_DOWN:
        return SNAKE_HEAD_DOWN;
    case SNAKE_LEFT:
        return SNAKE_HEAD_LEFT;
    case SNAKE_RIGHT:
        return SNAKE_HEAD_RIGHT;
    default:
        return SNAKE_HEAD_UP;
    }
}
