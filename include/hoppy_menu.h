/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** menu.h
*/

#ifndef HOPPY_MENU_H
    #define HOPPY_MENU_H
    #define MENU_ITEMS 3
    #include <stdint.h>

enum menu_labels {
    HOPPY_SNAKE,
    HOPPY_BIRD,
    HOPPY_RUN
};

typedef struct menu_s {
    int id;
    void (*func)(void);
} menu_t;

void draw_menu(uint8_t selected);
void handle_menu_input(uint8_t *selected, uint8_t keys, uint8_t prev_keys);
void launch_selected_game(uint8_t selected);
void init_menu(uint8_t selected);

#endif
