;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module snake_board_t
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_tile_at
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
;src/games/hoppy_snake/snake_board_t.c:11: tile_data_t *get_tile_at(snake_board_t *snake_board, coords_t cds)
;	---------------------------------
; Function get_tile_at
; ---------------------------------
_get_tile_at::
	add	sp, #-4
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/games/hoppy_snake/snake_board_t.c:14: (cds.values[0] >= BOARD_HEIGHT)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x11
	ld	a, b
	sbc	a, #0x00
	jr	NC, 00101$
;src/games/hoppy_snake/snake_board_t.c:15: || (cds.values[1] >= BOARD_WIDTH)
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0x14
	ld	a, (hl)
	sbc	a, #0x00
	jr	C, 00102$
00101$:
;src/games/hoppy_snake/snake_board_t.c:17: return NULL;
	ld	bc, #0x0000
	jr	00104$
00102$:
;src/games/hoppy_snake/snake_board_t.c:21: cds.values[0] * BOARD_WIDTH
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
;src/games/hoppy_snake/snake_board_t.c:22: + cds.values[1]
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
00104$:
;src/games/hoppy_snake/snake_board_t.c:25: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
