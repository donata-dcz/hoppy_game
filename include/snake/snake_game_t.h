/*
** EPITECH PROJECT, 2026
** snake_game_t.h
** File description:
** snake_game_t
*/

#ifndef SNAKE_GAME_T_H_
    #define SNAKE_GAME_T_H_
    #include <gb/gb.h>
    #include "snake_board_t.h" // snake_board_t
    #include "tile_data_t.h" // tile_data_t
    #include "snake_game_events.h" // snake_game_key_t

typedef struct snake_game_s {
    snake_board_t board;
    size_t unflold;
    coords_t head_coords;
    coords_t tail_tip_coords;
    char score;
} snake_game_t;

int place_fish(snake_game_t *game);
int init_snake_game(snake_game_t *snake_game);
snake_game_key_t snake_step(snake_game_t *game_data);
tile_data_t *get_member_next(snake_game_t *snake_game, coords_t coords);

#endif /* SNAKE_GAME_T_H_ */
