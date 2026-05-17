/*
** EPITECH PROJECT, 2026
** snake_key_handler.h
** File description:
** snake_key_handler
*/

#ifndef SNAKE_KEY_HANDLER_H_
    #define SNAKE_KEY_HANDLER_H_
    #include "snake_game_t.h" // snake_game_t
    #include <types.h>
    #include <stdint.h>
    #include <gb/gb.h>
    #define SNAKE_KEYMASK (J_UP | J_DOWN | J_LEFT | J_RIGHT)

void snake_key_handler(snake_game_t *snake_game, uint8_t key_input);

#endif /* SNAKE_KEY_HANDLER_H_ */
