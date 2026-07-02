/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** flappy.h
*/

#ifndef FLAPPY_H
    #define FLAPPY_H
    #include <gb/gb.h>
    #define T_SKY 0
    #define T_GROUND 1
    #define T_WINBAR 2
    #define GROUND_ROW 16
    #define FLAPPY_BIRD_TILES_COUNT 8
    #define S_BIRD 50
    #define SPR_BIRD 0
    #define SPR_BIRD_R 1
    #define BIRD_X 40
    #define BIRD_INIT_Y 60
    #define FLAPPY_GRAVITY 1
    #define FLAPPY_MAX_FALL 2
    #define FLAPPY_JUMP_FORCE 4
    #define FLAPPY_GROUND_Y 112
    #define T_PIPE_CAP 3
    #define T_PIPE_CAP_FLIP 4
    #define T_PIPE_BODY 8
    #define PIPE_GAP 6
    #define PIPE_WIDTH 2
    #define PIPE_SPACING 22
    #define PIPE_MIN_GAP_Y 1
    #define PIPE_MAX_GAP_Y 9

typedef struct flappy_s {
    uint8_t bird_y;
    int8_t bird_vy;
    uint8_t ready;
    uint8_t score;
    uint8_t tick;
} flappy_t;

typedef struct pipe_state_s {
    uint8_t scroll_x;
    uint8_t pipe_phase;
    uint8_t cur_gap_y;
    uint8_t scored;
    uint8_t rng;
    int16_t pipe_screen_x;
} pipe_state_t;

flappy_t *flappy_get_state(void);
void init_pipes(void);
void update_pipes(void);
uint8_t pipe_hit_check(uint8_t bird_y);
uint8_t pipe_score_check(void);
void flappy_init(void);
uint8_t flappy_update(void);

#endif
