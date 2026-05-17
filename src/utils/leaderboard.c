/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** leaderboard.c
*/

#include <gbdk/platform.h>
#include "saved_data.h"

uint8_t AT(0xA000) savedCheckFlag;
uint8_t AT(0xA001) savedVersion;
uint8_t AT(0xA002) savedScores[3 * MAX_SCORES];

void init_save_data(void)
{
    uint8_t i = 0;

    ENABLE_RAM;
    if (savedCheckFlag == SAVE_FLAG && savedVersion == SAVE_VERSION) {
        DISABLE_RAM;
        return;
    }
    savedCheckFlag = SAVE_FLAG;
    savedVersion = SAVE_VERSION;
    for (i = 0; i < 3 * MAX_SCORES; i++)
        savedScores[i] = 0;
    DISABLE_RAM;
}

void save_score(uint8_t game_id, uint8_t score)
{
    uint8_t scores[MAX_SCORES];
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t score_offset = game_id * MAX_SCORES;

    load_scores(game_id, scores);
    for (i = 0; i < MAX_SCORES; i++) {
        if (score <= scores[i])
            continue;
        for (j = MAX_SCORES - 1; j > i; j--)
            scores[j] = scores[j - 1];
        scores[i] = score;
        break;
    }
    ENABLE_RAM;
    savedCheckFlag = SAVE_FLAG;
    savedVersion = SAVE_VERSION;
    for (i = 0; i < MAX_SCORES; i++)
        savedScores[score_offset + i] = scores[i];
    DISABLE_RAM;
}

void load_scores(uint8_t game_id, uint8_t *scores)
{
    uint8_t i;
    uint8_t score_offset = game_id * MAX_SCORES;

    ENABLE_RAM;
    if (savedCheckFlag == SAVE_FLAG) {
        for (i = 0; i < MAX_SCORES; i++)
            scores[i] = savedScores[score_offset + i];
    } else {
        for (i = 0; i < MAX_SCORES; i++)
            scores[i] = 0;
    }
    DISABLE_RAM;
}
