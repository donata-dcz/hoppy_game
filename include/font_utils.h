/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** font_utils.h
*/

#ifndef FONT_UTILS_H
   #define FONT_UTILS_H
   #define FONT_TILE_OFFSET 128
   #define FONT_OFFSET_ALPHA (FONT_TILE_OFFSET + 1)
   #define FONT_OFFSET_DIGIT (FONT_TILE_OFFSET + 27)
   #define FONT_OFFSET_SYMBOL (FONT_TILE_OFFSET + 37)
   #include <stdint.h>

void menu_font_load(void);
void draw_text(uint8_t col, uint8_t row, const char *text);
uint8_t get_char_tile(char c);

#endif
