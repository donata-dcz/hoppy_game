/*
** EPITECH PROJECT, 2026
** place_fish.c
** File description:
** place_fish
*/

#include "snake_game_t.h"
#include "epitech_utils.h"
#include "snake_sprites_t.h" // macros
#include <stdlib.h>
#include <gb/gb.h>
#include <rand.h>
#include "snake_score.h" // set_score

#include <stdio.h>

static size_t get_fish_index(snake_board_t *game_board)
{
    size_t skip_counter = 0;
    size_t new_fish_index = 0;

    new_fish_index = ((size_t)rand()) % BOARD_SIZE;
    for (size_t i = 0; i <= new_fish_index; ++i) {
        if (i >= BOARD_SIZE && skip_counter == BOARD_SIZE)
            return FAILURE;
        if (i >= BOARD_SIZE) {
            i = 0;
            new_fish_index = rand() % (BOARD_SIZE - skip_counter);
        }
        if ((*game_board)[i] != SNAKE_VOID) {
            skip_counter++;
            new_fish_index++;
        }
    }
    return new_fish_index;
}

int place_fish(snake_game_t *game)
{
    uint8_t heart_tile_index = SNAKE_BGHEART_ASSET;
    size_t new_fish_index = get_fish_index(&(game->board));

    if (new_fish_index == (size_t)FAILURE)
        return FAILURE;
    game->board[new_fish_index] = FISH;
    set_bkg_tiles(new_fish_index % BOARD_WIDTH,
        new_fish_index / BOARD_WIDTH, 1, 1, &heart_tile_index);
    return SUCCESS;
}
