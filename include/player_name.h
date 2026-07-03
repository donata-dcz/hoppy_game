/*
** EPITECH PROJECT, 2026
** hoppy_game
** File description:
** player_name.h
*/

#ifndef PLAYER_NAME_H
    #define PLAYER_NAME_H
    #define MAX_NAME_LEN 5
    #define COLS 8
    #define ROWS 4
    #include <gb/gb.h>
    #pragma disable_warning 110
    
typedef struct {
    char name[MAX_NAME_LEN + 1];
    uint8_t cursor;
    uint8_t selected;
    uint8_t done;
} name_input_t;

void init_name(name_input_t *input);
void draw_name_screen(name_input_t *input);
void handle_input_name(name_input_t *input, uint8_t keys, uint8_t prev_keys);
char get_selected_char(uint8_t row, uint8_t col);
void input_player_name(name_input_t *input);

#endif
