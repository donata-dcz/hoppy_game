/*
** EPITECH PROJECT, 2026
** coords_t.h
** File description:
** coords_t
*/

#ifndef COORDS_T_H_
    #define COORDS_T_H_
    #include <stddef.h>
    #include <stdbool.h>
    #define GAMEBOY_PADDING_Y 16
    #define GAMEBOY_PADDING_X 8
    #define SNAKE_TILE_SIZE 8

typedef struct coords_s {
    size_t values[2];
} coords_t;

void set_coords(coords_t *dest, coords_t origin);

#endif /* COORDS_T_H_ */
