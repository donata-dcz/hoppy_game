# Hoppy Game

Hoppy Game is an Epitech project that consists of doing a Game Boy cartridge containing multiple mini-games.

## Gameboy System

The Gameboy system has limited hardware ressources compared to our different laptops.

- CPU speed (4.19 MHz) (with additional limitations) and instruction set (Sharp LR35902)
- Limited RAM (8KB) and ROM.
- Limited color palette (4 colors per 8x8 tile).
- Sprite limitations (max 40 sprites, 10 per scanline).
- Sound: 4 channels (2 pulse, 1 wave, 1 noise).
- Input: 4 directions + A/B + Start/Select.

## Tech Stack

|         Components         |         Technologies           |
|----------------------------|--------------------------------|
| **Language**               | C / Assembly                   |
| **Compilation**            | GBDK 2020 / lcc                |
| **Asset editor**           | GBTD (Game Boy Tile Designer)  |
| **Emulator**               | RetroArch (core Gambatte)      |
| **Memory Bank Controller** | MBC5 (saving leaderboard data) |

## Installation

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

## Mini-Games

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

## Contributors

- [Armand CAMBOT](https://github.com/cambot-a)
- [Deniz DEMIR](https://github.com/DenizEpitech)
- [Donata CONTANT](https://github.com/donata-dcz)

## Credits

- Assets made by Donata CONTANT with `Gameboy Tile Designer`

We are also crediting Hoppy for giving us the idea of this game. Meet our Epitech favorite mascot:

<img width="668" height="891" alt="image" src="https://github.com/user-attachments/assets/26c995ab-b786-47cd-9df0-f3af816a93d7" />
