/*
** EPITECH PROJECT, 2026
** hoppy_game
** File description:
** playername.c
*/

#include "player_name.h"
#include "font_utils.h"
#include "sprites/empty_tiles.h"
#include <string.h>

typedef enum name_key_action_e {
    KEY_ACTION_LETTER,
    KEY_ACTION_EMPTY,
    KEY_ACTION_BACKSPACE,
    KEY_ACTION_DONE,
} name_key_action_t;

typedef struct name_key_s {
    const char *label;
    char letter;
    name_key_action_t action;
} name_key_t;

static const name_key_t uppercase_keyboard[ROWS][COLS] = {
    {
        {"A", 'A', KEY_ACTION_LETTER}, {"B", 'B', KEY_ACTION_LETTER},
        {"C", 'C', KEY_ACTION_LETTER}, {"D", 'D', KEY_ACTION_LETTER},
        {"E", 'E', KEY_ACTION_LETTER}, {"F", 'F', KEY_ACTION_LETTER},
        {"G", 'G', KEY_ACTION_LETTER}, {"H", 'H', KEY_ACTION_LETTER}
    },
    {
        {"I", 'I', KEY_ACTION_LETTER}, {"J", 'J', KEY_ACTION_LETTER},
        {"K", 'K', KEY_ACTION_LETTER}, {"L", 'L', KEY_ACTION_LETTER},
        {"M", 'M', KEY_ACTION_LETTER}, {"N", 'N', KEY_ACTION_LETTER},
        {"O", 'O', KEY_ACTION_LETTER}, {"P", 'P', KEY_ACTION_LETTER}
    },
    {
        {"Q", 'Q', KEY_ACTION_LETTER}, {"R", 'R', KEY_ACTION_LETTER},
        {"S", 'S', KEY_ACTION_LETTER}, {"T", 'T', KEY_ACTION_LETTER},
        {"U", 'U', KEY_ACTION_LETTER}, {"V", 'V', KEY_ACTION_LETTER},
        {"W", 'W', KEY_ACTION_LETTER}, {"X", 'X', KEY_ACTION_LETTER}
    },
    {
        {"Y", 'Y', KEY_ACTION_LETTER}, {"Z", 'Z', KEY_ACTION_LETTER},
        {"DEL", '\0', KEY_ACTION_BACKSPACE},  {"OK", '\0', KEY_ACTION_DONE},
        {"", ' ', KEY_ACTION_EMPTY}, {"", ' ', KEY_ACTION_EMPTY},
        {"", ' ', KEY_ACTION_EMPTY}, {"", ' ', KEY_ACTION_EMPTY},
    }
};

static const uint8_t row3_x[COLS] = {2, 4, 7, 12, 17, 0, 0, 0};

static const name_key_t *get_keyboard_key(uint8_t row, uint8_t col)
{
    return &uppercase_keyboard[row][col];
}

static uint8_t get_key_x(uint8_t row, uint8_t col)
{
    if (row == ROWS - 1)
        return row3_x[col];
    return 2 + col * 2;
}

static void clear_name_screen(void)
{
    uint8_t empty_tile = 0;
    uint8_t x = 0;
    uint8_t y = 0;

    for (y = 0; y < 18; y++) {
        for (x = 0; x < 20; x++)
            set_bkg_tiles(x, y, 1, 1, &empty_tile);
    }
}

static void draw_name_entry(const name_input_t *input)
{
    char display[2];
    uint8_t i = 0;

    draw_text(2, 1, "ENTER NAME:");
    for (i = 0; i < MAX_NAME_LEN; i++) {
        display[0] = (input->name[i] != '\0') ? input->name[i] : ' ';
        display[1] = '\0';
        draw_text(2 + i, 3, display);
    }
}

static void draw_keyboard(const name_input_t *input)
{
    uint8_t row = 0;
    uint8_t col = 0;
    uint8_t max_col = 0;
    const name_key_t *key = NULL;
    uint8_t x = 0;
    uint8_t y = 0;
    
    for (row = 0; row < ROWS; row++) {
        max_col = (row == ROWS - 1) ? 8 : COLS;
        for (col = 0; col < max_col; col++) {
            key = get_keyboard_key(row, col);
            if (key->action == KEY_ACTION_EMPTY)
                continue;
            x = get_key_x(row, col);
            y = 7 + row * 2;
            if (input->selected == row * COLS + col)
                draw_text(x - 1, y, "> ");
            else
                draw_text(x - 1, y, "  ");
            draw_text(x, y, key->label);
        }
    }
}

static uint8_t is_valid_key(uint8_t row, uint8_t col)
{
    const name_key_t *key = get_keyboard_key(row, col);

    return key->action != KEY_ACTION_EMPTY;
}

static void move_selection(name_input_t *input, int8_t row_delta,
    int8_t col_delta)
{
    uint8_t row = input->selected / COLS;
    uint8_t col = input->selected % COLS;
    
    row = (row + ROWS + row_delta) % ROWS;
    if (row == ROWS - 1) {
        col = (col + COLS + col_delta) % COLS;
    } else {
        col = (col + COLS + col_delta) % COLS;
    }
    input->selected = row * COLS + col;
    if (!is_valid_key(row, col))
        input->selected = (ROWS - 1) * COLS + 3;
}

static void apply_selected_key(name_input_t *input)
{
    const name_key_t *key = get_keyboard_key(input->selected / COLS, input->selected % COLS);
    
    if (key->action == KEY_ACTION_LETTER) {
        if (input->cursor < MAX_NAME_LEN) {
            input->name[input->cursor] = key->letter;
            input->cursor++;
            input->name[input->cursor] = '\0';
        }
    }
    else if (key->action == KEY_ACTION_BACKSPACE) {
        if (input->cursor > 0) {
            input->cursor--;
            input->name[input->cursor] = '\0';
        }
    }
    else if (key->action == KEY_ACTION_DONE) {
        input->done = 1;
    }
}

void init_name(name_input_t *input)
{
    uint8_t i = 0;

    for (i = 0; i < MAX_NAME_LEN + 1; i++)
        input->name[i] = '\0';
    input->cursor = 0;
    input->selected = 0;
    input->done = 0;
}

char get_selected_char(uint8_t row, uint8_t col)
{
    if (row >= ROWS || col >= COLS)
        return ' ';
    if (row == ROWS - 1) {
        if (col == 0)
            return 'Y';
        if (col == 1)
            return 'Z';
        if (col == 2)
            return 'D';
        if (col == 3)
            return 'C';
        if (col == 4)
            return 'O';
        return ' ';
    }
    return uppercase_keyboard[row][col].letter;
}

void draw_name_screen(name_input_t *input)
{
    draw_name_entry(input);
    draw_keyboard(input);
}

void handle_input_name(name_input_t *input, uint8_t keys, uint8_t prev_keys)
{
    if ((keys & ~prev_keys) & J_DOWN) {
        move_selection(input, 1, 0);
        delay(100);
    }
    else if ((keys & ~prev_keys) & J_UP) {
        move_selection(input, -1, 0);
        delay(100);
    }
    else if ((keys & ~prev_keys) & J_RIGHT) {
        move_selection(input, 0, 1);
        delay(100);
    }
    else if ((keys & ~prev_keys) & J_LEFT) {
        move_selection(input, 0, -1);
        delay(100);
    }
    else if ((keys & ~prev_keys) & J_A) {
        apply_selected_key(input);
        delay(100);
    }
}

void input_player_name(name_input_t *input)
{
    uint8_t prev_keys = 0xFF;
    uint8_t keys = 0;
    
    init_name(input);
    DISPLAY_OFF;
    set_bkg_data(0, 1, EmptyTile);
    BGP_REG = 0xE4;
    OBP0_REG = 0xE4;
    menu_font_load();
    init_bkg(0);
    SHOW_BKG;
    DISPLAY_ON;
    clear_name_screen();
    draw_name_screen(input);
    while (!input->done) {
        vsync();
        keys = joypad();
        handle_input_name(input, keys, prev_keys);
        if ((keys & ~prev_keys) & J_START)
            input->done = 1;
        draw_name_screen(input);
        prev_keys = keys;
    }
}
