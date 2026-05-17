/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** display_backgroud.c
*/

#include "sprites/cat_tiles.h"
#include "sprites/grass_tiles.h"
#include "sprites/earth_tiles.h"
#include "sprites/empty_tiles.h"
#include "sprites/pipe_tiles.h"
#include "sprites/sleeping_hoppy.h"
#include "sprites/lifes_tiles.h"
#include "hoppy_game.h"

void draw_lives(uint8_t lives)
{
    set_sprite_tile(5, LIFES_SPRITE_OFFSET + (MAX_LIVES - lives) * 2 + 2);
}

void display_background(void)
{
    uint8_t empty_tile = TILE_EMPTY;
    uint8_t grass_tile = TILE_GRASS;
    uint8_t earth_tile = TILE_EARTH;

    SCX_REG = 0;
    set_bkg_data(0, 1, EmptyTile);
    set_bkg_data(1, 1, GrassTiles);
    set_bkg_data(2, 1, EarthTiles);
    for (uint8_t y = 0; y < 18; y++)
        for (uint8_t x = 0; x < 32; x++)
            set_bkg_tiles(x, y, 1, 1, &empty_tile);
    for (uint8_t x = 0; x < 32; x++)
        set_bkg_tiles(x, 14, 1, 1, &grass_tile);
    for (uint8_t y = 15; y < 18; y++)
        for (uint8_t x = 0; x < 32; x++)
            set_bkg_tiles(x, y, 1, 1, &earth_tile);
}

void display_hoppy(input_t *input, uint8_t lives)
{
    SPRITES_8x16;
    set_sprite_data(0, 12, CatTiles);
    set_sprite_data(12, 4, SleepingHoppy);
    set_sprite_data(LIFES_SPRITE_OFFSET, LIFES_TILE_COUNT, LifesTiles);
    move_sprite(0, CAT_X, (uint8_t)input->cat_y);
    set_sprite_tile(1, 2);
    move_sprite(1, CAT_X + 8, (uint8_t)input->cat_y);
    set_sprite_tile(2, 12);
    move_sprite(2, 14, 18);
    set_sprite_tile(3, 14);
    move_sprite(3, 22, 18);
    set_sprite_tile(4, LIFES_SPRITE_OFFSET);
    move_sprite(4, 34, 22);
    draw_lives(lives);
    move_sprite(5, 42, 22);
}

void display_pipe(void)
{
    set_bkg_data(TILE_PIPE_HEAD, 1, PipeHeadTiles);
    set_bkg_data(TILE_PIPE_BODY, 1, PipeTailTiles);
}

void draw_pipe_at(uint8_t col, uint8_t height, bool erase)
{
    uint8_t row = 0;
    uint8_t tile = 0;

    for (uint8_t h = 0; h < height; h++) {
        row = PIPE_BASE_ROW - h;
        tile = 0;
        if (erase)
            tile = TILE_EMPTY;
        else
            tile = (h == height - 1) ? TILE_PIPE_HEAD : TILE_PIPE_BODY;
        set_bkg_tiles(col, row, 1, 1, &tile);
    }
}
