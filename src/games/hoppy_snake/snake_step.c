/*
** EPITECH PROJECT, 2026
** snake_step.c
** File description:
** snake_step
*/

#include "snake_game_t.h" // snake_step, snake_game_t, get_member_next
#include "snake_sprites_t.h" // get_head_sprite
#include "snake_board_t.h" // get_tile_at, get_coords_next
#include "tile_data_t.h" // tile_data_t
#include "epitech_utils.h" // macros
#include <gb/gb.h>

static void display_head(coords_t coords, tile_data_t direction)
{
    size_t x = coords.values[1];
    size_t y = coords.values[0];

    move_sprite(get_head_sprite(direction),
        x * 8 + GAMEBOY_PADDING_X,
        y * 8 + GAMEBOY_PADDING_Y
    );
}

static void snake_step_vram(coords_t *destination_coords,
    tile_data_t *tile_to_move, coords_t *head_coords)
{
    uint8_t body_tile_index = SNAKE_BGBODY_ASSET;
    uint8_t empty_tile_index = SNAKE_BGEMPTY_ASSET;

    display_head(*destination_coords, *tile_to_move);
    set_bkg_tiles(destination_coords->values[1],
        destination_coords->values[0], 1, 1, &empty_tile_index);
    set_bkg_tiles(head_coords->values[1],
        head_coords->values[0], 1, 1, &body_tile_index);
}

static int move_snake_head(snake_game_t *game_data)
{
    tile_data_t *tile_to_move = get_tile_at(&(game_data->board),
        game_data->head_coords);
    coords_t destination_coords = game_data->head_coords;
    tile_data_t *destination_tile = get_member_next(game_data,
        game_data->head_coords);

    if (tile_to_move == NULL || destination_tile == NULL
        || get_coords_next(
            &(game_data->board), &destination_coords) == FAILURE)
        return FAILURE;
    if (*destination_tile != SNAKE_VOID && *destination_tile != FISH)
        return FAILURE;
    snake_step_vram(&destination_coords, tile_to_move,
        &(game_data->head_coords));
    set_coords(&(game_data->head_coords), destination_coords);
    *destination_tile = *tile_to_move;
    return SUCCESS;
}

static int process_snake_events(bool fish_eaten,
    int move_snake_head_success_status)
{
    if (move_snake_head_success_status == FAILURE)
        return GAME_OVER;
    if (fish_eaten)
        return FISH_EATEN;
    return NO_EVENT;
}

static void move_snake_tail(size_t *unflold, coords_t *tail_coords,
    coords_t *tail_next_coords, tile_data_t *tail)
{
    uint8_t empty_tile_index = SNAKE_BGEMPTY_ASSET;

    if (*unflold) {
        *unflold -= 1;
    } else {
        set_bkg_tiles(tail_coords->values[1],
            tail_coords->values[0], 1, 1, &empty_tile_index);
        *tail = SNAKE_VOID;
        *tail_coords = *tail_next_coords;
    }
}

snake_game_key_t snake_step(snake_game_t *game_data)
{
    tile_data_t *destination_tile = get_member_next(game_data,
        game_data->head_coords);
    bool fish_eaten = false;
    tile_data_t *tail = get_tile_at(&(game_data->board),
        game_data->tail_tip_coords);
    coords_t tail_next_coords = game_data->tail_tip_coords;

    if (destination_tile == NULL ||
        get_coords_next(&(game_data->board), &(tail_next_coords)) == FAILURE)
        return GAME_OVER;
    fish_eaten = (*destination_tile == FISH);
    if (!fish_eaten)
        move_snake_tail(&(game_data->unflold), &(game_data->tail_tip_coords),
            &tail_next_coords, tail);
    SHOW_BKG;
    return process_snake_events(fish_eaten, move_snake_head(game_data));
}
