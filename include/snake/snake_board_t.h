/*
** EPITECH PROJECT, 2026
** snake_board_t.h
** File description:
** snake_board_t
*/

#ifndef SNAKE_BOARD_T_H_
    #define SNAKE_BOARD_T_H_
    #include "coords_t.h" // coords_t
    #include "snake_game_data.h" // macros
    #include "tile_data_t.h" // tile_data_t

typedef tile_data_t snake_board_t[BOARD_SIZE];

tile_data_t *get_tile_at(snake_board_t *snake_board, coords_t cds);
int get_coords_next(snake_board_t *snake_board, coords_t *coords);

#endif /* SNAKE_BOARD_T_H_ */
