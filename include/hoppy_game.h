/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** hoppy_game.h
*/

#ifndef HOPPY_GAME
    #define HOPPY_GAME
    #define CAT_X 40
    #define GROUND_Y 116
    #define JUMP_FORCE 9
    #define GRAVITY 1
    #define ANIM_SPEED 8
    #define MAX_LIVES 3
    #define PIPE_SPAWN_X 154
    #define HOVER_FRAMES 8
    #define TILE_EMPTY 0
    #define TILE_GRASS 1
    #define TILE_EARTH 2
    #define TILE_PIPE_HEAD 3
    #define TILE_PIPE_BODY 4
    #define PIPE_BASE_ROW 13
    #define PIPE_HEIGHT_MIN 2
    #define PIPE_HEIGHT_MAX 2
    #define LIFES_SPRITE_OFFSET 16
    #define LIFES_TILE_COUNT 8
    #define SCORE_SPRITE_OFFSET 24
    #define SCORE_TILE_COUNT 4
    #define SPEED_INCREASE_INTERVAL 500
    #include "player_name.h"
    #include <gb/gb.h>
    #include <stdbool.h>

extern char hoppy_name[MAX_NAME_LEN + 1];

typedef struct display_s {
    uint8_t frame;
    uint8_t counter;
    uint16_t scroll;
    uint8_t lives;
    uint16_t speed;
} display_t;

typedef struct input_s {
    uint8_t keys;
    int8_t jump_level;
    bool is_jumping;
    int8_t cat_y;
    uint8_t hover_timer;
} input_t;

typedef struct pipe_s {
    uint16_t world_x;
    uint8_t height;
    uint8_t col;
    bool active;
} pipe_t;

typedef struct loop_s {
    pipe_t pipe;
    uint8_t invincible;
    uint8_t increase;
} loop_t;

void display_background(void);
void manage_main_loop(display_t *display, input_t *input);
void draw_lives(uint8_t lives);
void display_pipe(void);
void draw_pipe_at(uint8_t col, uint8_t height, bool erase);
void draw_hoppy_score(uint16_t score);
void setup_score_window(void);
void display_hoppy(input_t *input, uint8_t lives);
void handle_input(input_t *input);
void handle_jump(input_t *input);
void handle_run(display_t *display);
void update_pipe(pipe_t *pipe, display_t *display);
bool handle_collisions(pipe_t *pipe, input_t *input, display_t *display);
void run_snake(void);
void run_flappy(void);
void run_hoppy(void);
void run_hoppy_game(void);
void checkerboard_wipe_transition(void);
void clear_all_sprites(void);

#endif
