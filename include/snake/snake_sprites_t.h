/*
** EPITECH PROJECT, 2026
** snake_sprites_t.h
** File description:
** snake_sprites_t
*/

#ifndef SNAKE_SPRITES_T_H_
    #define SNAKE_SPRITES_T_H_
    #include "tile_data_t.h" // tile_data_t

typedef enum snake_head_positions_s {
    SNAKE_HEAD_UP = 0,
    SNAKE_HEAD_DOWN = 1,
    SNAKE_HEAD_LEFT = 2,
    SNAKE_HEAD_RIGHT = 3
} snake_head_positions_t;

typedef enum SnakeSPrites {
    SNAKE_BGEMPTY_ASSET = 0,
    SNAKE_BGBODY_ASSET = 1,
    SNAKE_BGHEART_ASSET = 2,
    SNAKE_BGBACKGROUND_ASSET = 3,
    SNAKE_BGSCORE_ASSET = 4
} snake_sprites_t;

snake_head_positions_t get_head_sprite(tile_data_t direction);

#endif /* SNAKE_SPRITES_T_H_ */
