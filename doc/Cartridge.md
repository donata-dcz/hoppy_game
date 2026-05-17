# Hoppy Game

**Hoppy Game** is a Game Boy cartridge containing multiple mini-games. We were inspired for the game names, by our favorite Epitech mascot: Hoppy !

---

## Table of contents

1. [Architecture](#1-architecture)
2. [Games](#2-games)
3. [Usage](#3-usage)
4. [Adding new Game](#4-adding-new-game)
5. [Adding new Assets](#5-adding-new-assets)
6. [Adding new Text](#6-adding-new-text)
7. [Troubleshoot](#7-troubleshoot)

---

## 1. Architecture

The cartridge project consists of a main menu where you can select from three different mini-games. All games share a common font and sprites system.

### Architecture Diagram

<img width="1224" height="809" alt="image" src="https://github.com/user-attachments/assets/b64291aa-6f15-471c-b5d4-8ab93196aace" />

---

## 2. Games

### Hoppy Snake

The **Hopppy Snake** game is a simple arcade game where the player controls a snake that moves around to eat a heart, it makes him regains life. The goal is to keep eating food without crashing into the walls. The game ends when the snake crashes, with the player's score based on how much hearts was collected.

- The game area is a finite grid. Edges either block movement or are cyclical.
- The snake starts at size 4 in the middle of the area.
- It moves forward automatically at constant speed - each body section follows the head's exact path.
- The snake turns left or right on keypress.
- The goal is to eat hearts to grow. There is always at least one heart element on the board.
- Eating hearts adds one section at the tail and spawns a new heart.
- The game ends when the head hits a wall (non-cyclical map) or the snake's own body.
- The head section is visually distinct from the body.

| Key    | Action              |
|--------|---------------------|
| Arrows | Change direction    |
| Start  | Start the game      |
| Select | Return to main menu |

### Hoppy Bird

The **Hoppy Bird** is an arcade-style game in which the player controls the bird Hoppy, which moves persistently to the right. They are tasked with navigating Hoppy through pairs of pipes that have equally sized gaps placed at random heights. Hoppy automatically descends and only ascends when the player taps the touchscreen.

- Simple tap controls that make the game easy for kids to understand and play right away.
- Fast rounds that let you restart quickly and try again without waiting.
- Black & White pixel art that gives the game a bright and classic arcade look.
- Random pipe heights that keep each round different and exciting.
- Addictive high-score system that pushes players to improve every time they play.
- Lightweight gameplay that works smoothly on almost any device.
- Fun challenge that rewards good timing and focus, making each win feel great.

| Key          | Action              |
|--------------|---------------------|
| Up arrow / A | Flap                |
| Start        | Start the game      |
| Select       | Return to main menu |

### Hoppy Run

The **Hoppy Run** game is an endless runner arcade game in which the player controls Hoppy, the Epitech cat, which moves persistently to the right. The player is tasked with navigating Hoppy through randomly generated pipes placed at varying heights. Hoppy automatically runs forward and the player must time jumps to avoid obstacles.

- Animated running sprite of a cat
- Jumping frame on keyboard press
- Progressive difficulty system that gradually increases scroll speed
- Infinite scrolling background creating the illusion of endless forward movement
- Life system counted as Hoppy lifes, displayed as sprites in the HUD
- Randomly generated pipes obstacles
- Invincibility frames after collision to prevent consecutive damage
- Score tracking based on distance traveled with leaderboard

| Key          | Action                  |
|--------------|-------------------------|
| Up arrow / A | Jump                    |
| Start        | Restart after game over |
| Select       | Return to main menu     |

---

## 3. Usage

### Prerequisites

- [GBDK-2020](https://github.com/gbdk-2020/gbdk-2020) installed
- `lcc` (provided by GBDK)
- A Game Boy emulator - we recommend **RetroArch** with the **Gambatte** core

### Build & Run

```bash
# Clone the repository
git clone git@github.com:EpitechPGE2-2025/G-ING-401-PAR-4-1-cartridge-2.git
cd G-ING-401-PAR-4-1-cartridge-2

# Compile
make re
```

Load the generated `.gb` file into your emulator.

### Menu Controls

<img width="1125" height="1003" alt="image" src="https://github.com/user-attachments/assets/ab6ddfb0-f053-48fc-92f7-0434d1e8e68e" />

| Key       | Action                 |
|-----------|------------------------|
| Up / Down | Navigate between games |
| Key A     | Launch selected game   |

---

## 4. Adding new Game

1. Create the game files

Create `include/hoppy_new_game.h`:

```c
#ifndef HOPPY_NEW_GAME_H
    #define HOPPY_NEW_GAME_H

void run_hoppy_new_game(void);

#endif
```

Create `src/hoppy_new_game.c`:

```c
#include <gb/gb.h>
#include "font_utils.h"
#include "hoppy_new_game.h"

void run_hoppy_new_game(void)
{
    /*Your game logic here*/
}
```

2. Register in the menu (src/menu.c)

Increment `MENU_ITEMS` and add the label in the enum `menu_labels` and the const char in `draw_menu`:

```c
#define MENU_ITEMS 4

enum menu_labels {
    HOPPY_SNAKE,
    HOPPY_BIRD,
    HOPPY_RUN,
    HOPPY_NEW_GAME
};

const char *menu_labels[] = {
    "HOPPY SNAKE", "HOPPY BIRD", "HOPPY RUN", "HOPPY NEW GAME"
};
```

Add the call in the menu loop:

```c
menu_t game_labels[] = {
    {HOPPY_SNAKE, run_snake}, {HOPPY_BIRD, run_flappy},
    {HOPPY_RUN, run_hoppy}, {HOPPY_NEW_GAME, run_new_game}, {0, NULL}
};
```

3. Add to the Makefile

Add `src/my_game.c` to the list of source files in the `Makefile`.

> Add the game_over_screen() function, so that the game prints the leaderboard and let the player being able to restart or going back to the menu.

---

## 5. Adding new Assets

1. Draw the sprite in GBTD

Open **Gameboy Tile Designer** (GBTD) and draw your tiles in **8x8** or **16x16** format, using **Gameboy 4 color** mode.

2. Export the sprite as C

In GBTD: export as `include/sprites/hoppy_new_tiles.h`.

Your file should look something like this:

```c
#ifndef HOPPY_NEW_TILES
    #define HOPPY_NEW_TILES

const unsigned char HoppyNewTiles[] = {
    0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00,
    0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
};

#endif
```

3. Display your new assets

In your game file, display your new sprite:

```c
#include "include/sprites/hoppy_new_tiles.h"

set_sprite_data(0, 12, HoppyNewTiles);
```

or your new background:

```c
#include "include/sprites/hoppy_new_tiles.h"

set_bkg_data(0, 1, HoppyNewTiles);
```

---

## 6. Adding new Text

The current text is rendered using the shared font system (`font_utils.c`).

### Load the font

Call `font_load()` once before drawing any text. It loads the tiles in the background starting at `FONT_TILE_OFFSET`.

```c
font_load();
```

### Draw text on the background

```c
draw_text(4, 8, "GAME OVER");
draw_text(2, 10, "PRESS START");
```

> The background scrolls with the variable `SCX_REG`. Always reset `SCX_REG = 0` before drawing text.

### Supported characters

The current font contains actually 45 tiles (`include/sprites/font.h`):

<img width="801" height="297" alt="image" src="https://github.com/user-attachments/assets/55b03d2d-dfea-42d2-8d0b-f6d2723de3d5" />

## 7. Troubleshoot

### Compilation problem

- If you are encouring problems with the compilation of the Makefile, you should use this following command to compile with lcc:

```
sudo mv ~/gbdk /opt/
echo 'export PATH=$PATH:/opt/gbdk/bin' >> ~/.zshrc
```
