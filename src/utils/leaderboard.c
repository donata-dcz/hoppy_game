/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** leaderboard.c
*/

#include <gbdk/platform.h>
#include <string.h>
#include "saved_data.h"

uint8_t AT(0xA000) savedCheckFlag;
uint8_t AT(0xA001) savedVersion;
score_t AT(0xA002) savedScores[3 * MAX_SCORES];

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
    for (i = 0; i < 3 * MAX_SCORES; i++) {
        savedScores[i].score = 0;
        savedScores[i].name[0] = '\0';
    }
    DISABLE_RAM;
}

void load_scores(uint8_t game_id, score_t *scores)
{
    uint8_t i = 0;
    uint8_t offset = game_id * MAX_SCORES;

    ENABLE_RAM;
    if (savedCheckFlag == SAVE_FLAG &&
        savedVersion == SAVE_VERSION) {
        for (i = 0; i < MAX_SCORES; i++)
            scores[i] = savedScores[offset + i];
    } else {
        for (i = 0; i < MAX_SCORES; i++) {
            scores[i].score = 0;
            scores[i].name[0] = '\0';
        }
    }
    DISABLE_RAM;
}

void save_score(uint8_t game_id, uint16_t score, const char *name)
{
    score_t scores[MAX_SCORES];
    uint8_t offset = game_id * MAX_SCORES;
    uint8_t i, j;
    uint8_t inserted = 0;

    if (score > 999)
        score = 999;
    load_scores(game_id, scores);
    for (i = 0; i < MAX_SCORES; i++) {
        if (!inserted && score >= scores[i].score) {
            for (j = MAX_SCORES - 1; j > i; j--) {
                scores[j] = scores[j - 1];
            }
            scores[i].score = score;
            strncpy(scores[i].name, name, MAX_NAME_LEN);
            scores[i].name[MAX_NAME_LEN] = '\0';
            inserted = 1;
            break;
        }
    }
    if (!inserted) {
        scores[MAX_SCORES - 1].score = score;
        strncpy(scores[MAX_SCORES - 1].name, name, MAX_NAME_LEN);
        scores[MAX_SCORES - 1].name[MAX_NAME_LEN] = '\0';
    }
    ENABLE_RAM;
    savedCheckFlag = SAVE_FLAG;
    savedVersion = SAVE_VERSION;
    for (i = 0; i < MAX_SCORES; i++) {
        savedScores[offset + i] = scores[i];
    }
    DISABLE_RAM;
}
