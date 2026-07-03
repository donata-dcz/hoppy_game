/*
** EPITECH PROJECT, 2026
** G-ING-401-PAR-4-1-cartridge-2
** File description:
** hoppy_game.c
*/

#include <gb/gb.h>
#include "sprites/sleeping_hoppy.h"
#include "font_utils.h"
#include "hoppy_menu.h"
#include "hoppy_game.h"
#include "saved_data.h"
#include <string.h>

char hoppy_name[MAX_NAME_LEN + 1] = "PLAYER";

static void display_main_screen(void)
{
    init_bkg(0);
    draw_text(5, 8, "HOPPY GAME");
    SPRITES_8x16;
    set_sprite_data(0, 4, SleepingHoppy);
    set_sprite_tile(0, 0);
    move_sprite(0, 83, 94);
    set_sprite_tile(1, 2);
    move_sprite(1, 91, 94);
    SHOW_SPRITES;
}

static void fade_in_out(uint8_t *palette)
{
    for (uint8_t i = 0; i < 4; i++) {
        BGP_REG = palette[i];
        OBP0_REG = palette[i];
        delay(150);
    }
}

void init_menu(uint8_t selected)
{
    uint8_t palette_in[] = { 0x00, 0x50, 0xA8, 0xE4 };
    uint8_t palette_out[] = { 0xE4, 0xA8, 0x50, 0x00 };
    name_input_t input;

    init_save_data();
    menu_font_load();
    SHOW_BKG;
    SCX_REG = 0;
    display_main_screen();
    fade_in_out(palette_in);
    delay(3000);
    fade_in_out(palette_out);
    HIDE_SPRITES;
    clear_all_sprites();
    input_player_name(&input);
    strcpy(hoppy_name, input.name);
    draw_menu(selected);
    fade_in_out(palette_in);
}
