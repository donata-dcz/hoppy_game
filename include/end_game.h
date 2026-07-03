/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** end_game.h
*/

#ifndef ENDGAME_H
    #define ENDGAME_H
    #include <stdbool.h>
    #include <stdint.h>
    #define SCREEN_W 20
    #define SCREEN_H 18
    #define PADDING_ROW "                    \n"
    #define PADDING_GAME_OVER PADDING_ROW PADDING_ROW PADDING_ROW PADDING_ROW

bool game_over_screen(uint8_t id, uint16_t score, char * hoppy_name);

#endif /* ENDGAME_H */
