/*
** EPITECH PROJECT, 2026
** init_snake_game.c
** File description:
** init_snake_game
*/

#include "snake_game_t.h" // place_fish, init_snake_game, snake_game_t
#include "epitech_utils.h" // macros
#include <string.h> // memset
#include <rand.h> // initarand
#include <gb/gb.h>
#include "snake_score.h" // init_snake_score
#include "snake_assets.h" // SnakeBodyTiles, EmptyTile, HeartTiles,
    // BackgroundTile, DigitTiles, SnakeHeadTiles
#include "tile_data_t.h" // tile_data_t
#include "snake_sprites_t.h" // macros
#include "coords_t.h" // set_coords, coords_t
#include "hoppy_game.h"
#include "coin.h"

static void init_snake_background(void)
{
    set_bkg_data(SNAKE_BGBODY_ASSET, 1, SnakeBodyTiles);
    set_bkg_data(SNAKE_BGEMPTY_ASSET, 1, EmptyTile);
    set_bkg_data(SNAKE_BGHEART_ASSET, 1, CoinTiles);
    set_bkg_data(SNAKE_BGBACKGROUND_ASSET, 1, BackgroundTile);
    set_bkg_data(SNAKE_BGSCORE_ASSET, DIGIT_TILES_COUNT, DigitTiles);
    SHOW_BKG;
}

static void init_snake_sprites(void)
{
    SPRITES_8x8;
    set_sprite_data(0, 4, SnakeHeadTiles);
    set_sprite_tile(SNAKE_HEAD_UP, 0);
    set_sprite_tile(SNAKE_HEAD_DOWN, 1);
    set_sprite_tile(SNAKE_HEAD_LEFT, 2);
    set_sprite_tile(SNAKE_HEAD_RIGHT, 3);
    SHOW_SPRITES;
}

int init_snake_game(snake_game_t *snake_game)
{
    tile_data_t *snake_head = NULL;
    coords_t snake_coords = {{BOARD_HEIGHT / 2, BOARD_WIDTH / 2}};

    clear_all_sprites();
    init_snake_background();
    init_snake_sprites();
    init_bkg(0);
    vsync();
    init_snake_score(&(snake_game->score));
    initarand((uint16_t)&snake_game);
    memset(snake_game, SNAKE_VOID, sizeof(snake_game_t));
    set_coords(&(snake_game->head_coords), snake_coords);
    set_coords(&(snake_game->tail_tip_coords), snake_game->head_coords);
    snake_game->unflold = (SNAKE_START_SIZE - 1);
    snake_head = get_tile_at(&(snake_game->board), snake_game->head_coords);
    *snake_head = SNAKE_START_DIRECTION;
    place_fish(snake_game);
    snake_game->score = 0;
    return SUCCESS;
}
