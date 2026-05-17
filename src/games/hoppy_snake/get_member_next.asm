;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module get_member_next
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_coords_next
	.globl _get_tile_at
	.globl _get_member_next
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
;src/games/hoppy_snake/get_member_next.c:13: tile_data_t *get_member_next(snake_game_t *snake_game, coords_t coords)
;	---------------------------------
; Function get_member_next
; ---------------------------------
_get_member_next::
	add	sp, #-4
;src/games/hoppy_snake/get_member_next.c:15: coords_t next_coords = coords;
	push	de
	ld	bc, #0x0004
	push	bc
	ld	hl, #10
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	pop	de
;src/games/hoppy_snake/get_member_next.c:17: if (get_coords_next(&(snake_game->board), &next_coords) == FAILURE)
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	push	de
	call	_get_coords_next
	pop	de
	ld	a, c
	and	a, b
	inc	a
	jr	NZ, 00102$
;src/games/hoppy_snake/get_member_next.c:18: return NULL;
	ld	bc, #0x0000
	jr	00103$
00102$:
;src/games/hoppy_snake/get_member_next.c:19: return get_tile_at(&(snake_game->board), next_coords);
	ld	hl,#0x3
	add	hl,sp
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl-)
	ld	c, a
	push	bc
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_get_tile_at
00103$:
;src/games/hoppy_snake/get_member_next.c:20: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
