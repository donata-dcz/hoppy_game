/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** leaderboard.c
*/

#include <gbdk/platform.h>
#include "saved_data.h"
#include <string.h>

uint8_t AT(0xA000) savedCheckFlag;
uint8_t AT(0xA001) savedVersion;
uint16_t AT(0xA002) savedScores[3 * MAX_SCORES];
char AT(0xA020) savedNames[3 * MAX_SCORES * (MAX_NAME_LEN + 1)];

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

void save_score(uint8_t game_id, uint16_t score)
{
    uint16_t scores[MAX_SCORES];
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t score_offset = game_id * MAX_SCORES;

    if (score > 999)
        score = 999;
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

void load_scores(uint8_t game_id, uint16_t *scores)
{
    uint8_t i = 0;
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

void load_scores_with_names(uint16_t game_id, score_t *scores)
{
    uint8_t offset = 0;
    uint8_t i = 0;
    
    if (game_id >= 3)
        return;
    offset = game_id * MAX_SCORES;
    ENABLE_RAM;
    if (savedCheckFlag != SAVE_FLAG) {
        for (i = 0; i < MAX_SCORES; i++) {
            scores[i].score = 0;
            scores[i].name[0] = '\0';
        }
    } else {
        for (i = 0; i < MAX_SCORES; i++) {
            scores[i].score = savedScores[offset + i];
            strcpy(scores[i].name, &savedNames[(offset + i) * (MAX_NAME_LEN + 1)]);
        }
    }
    DISABLE_RAM;
}

void save_score_name(uint16_t game_id, uint16_t score, const char *name)
{
    score_t scores[MAX_SCORES];
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t offset = 0;
    
    if (game_id >= 3)
        return;
    load_scores_with_names(game_id, scores);
    offset = game_id * MAX_SCORES;
    for (i = 0; i < MAX_SCORES; i++) {
        if (score > scores[i].score) {
            for (j = MAX_SCORES - 1; j > i; j--) {
                scores[j].score = scores[j - 1].score;
                strcpy(scores[j].name, scores[j - 1].name);
            }
            scores[i].score = score;
            strcpy(scores[i].name, name);
            break;
        }
    }
    ENABLE_RAM;
    for (i = 0; i < MAX_SCORES; i++) {
        savedScores[offset + i] = scores[i].score;
        strcpy(&savedNames[(offset + i) * (MAX_NAME_LEN + 1)], scores[i].name);
    }
    DISABLE_RAM;
}

void save_player_name(const char *name)
{
    uint8_t i = 0;

    ENABLE_RAM;
    while (name[i] != '\0' && i < MAX_NAME_LEN) {
        savedNames[i] = name[i];
        i++;
    }
    savedNames[i] = '\0';
    DISABLE_RAM;
}
