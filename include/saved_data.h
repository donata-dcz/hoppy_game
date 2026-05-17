/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** saved_data.h
*/

#ifndef SAVED_DATA_H
    #define SAVED_DATA_H
    #include <gb/gb.h>
    #define SAVE_FLAG 0xA5
    #define SAVE_VERSION 0x01
    #define MAX_SCORES 5
    #define GAME_SNAKE 0
    #define GAME_FLAPPY 1
    #define GAME_HOPPY 2

void init_save_data(void);
void save_score(uint8_t game_id, uint8_t score);
void load_scores(uint8_t game_id, uint8_t *scores);

#endif
