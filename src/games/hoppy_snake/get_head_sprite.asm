;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module get_head_sprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_head_sprite
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;src/games/hoppy_snake/get_head_sprite.c:11: snake_head_positions_t get_head_sprite(tile_data_t direction)
;	---------------------------------
; Function get_head_sprite
; ---------------------------------
_get_head_sprite::
;src/games/hoppy_snake/get_head_sprite.c:13: switch (direction) {
	cp	a, #0x08
	jr	Z, 00101$
	cp	a, #0x10
	jr	Z, 00102$
	sub	a, #0x20
	jr	Z, 00103$
	jr	00104$
;src/games/hoppy_snake/get_head_sprite.c:14: case SNAKE_DOWN:
00101$:
;src/games/hoppy_snake/get_head_sprite.c:15: return SNAKE_HEAD_DOWN;
	ld	a, #0x01
	ret
;src/games/hoppy_snake/get_head_sprite.c:16: case SNAKE_LEFT:
00102$:
;src/games/hoppy_snake/get_head_sprite.c:17: return SNAKE_HEAD_LEFT;
	ld	a, #0x02
	ret
;src/games/hoppy_snake/get_head_sprite.c:18: case SNAKE_RIGHT:
00103$:
;src/games/hoppy_snake/get_head_sprite.c:19: return SNAKE_HEAD_RIGHT;
	ld	a, #0x03
	ret
;src/games/hoppy_snake/get_head_sprite.c:20: default:
00104$:
;src/games/hoppy_snake/get_head_sprite.c:21: return SNAKE_HEAD_UP;
	xor	a, a
;src/games/hoppy_snake/get_head_sprite.c:22: }
;src/games/hoppy_snake/get_head_sprite.c:23: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
