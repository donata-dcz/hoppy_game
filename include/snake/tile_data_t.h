/*
** EPITECH PROJECT, 2026
** tile_data_t.h
** File description:
** tile_data_t
*/

#ifndef TILE_DATA_T_H_
    #define TILE_DATA_T_H_

enum TileData {
    SNAKE_VOID = 1,
    FISH = 2,
    SNAKE_UP = 4,
    SNAKE_DOWN = 8,
    SNAKE_LEFT = 16,
    SNAKE_RIGHT = 32
};

typedef char tile_data_t;

#endif /* TILE_DATA_T_H_ */
