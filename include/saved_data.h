/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** saved_data.h
*/

#ifndef SAVED_DATA_H
    #define SAVED_DATA_H
    #define SAVE_FLAG 0xA5
    #define SAVE_VERSION 0x02
    #define MAX_SCORES 5
    #define GAME_SNAKE 0
    #define GAME_FLAPPY 1
    #define GAME_HOPPY 2
    #include "player_name.h"
    #include <gb/gb.h>

typedef struct {
    uint16_t score;
    char name[MAX_NAME_LEN + 1];
} score_t;

void init_save_data(void);
void load_scores(uint8_t game_id, score_t *scores);
void save_score(uint8_t game_id, uint16_t score, const char *name);

#endif
