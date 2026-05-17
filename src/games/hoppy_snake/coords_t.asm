;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module coords_t
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _memcpy
	.globl _set_coords
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
;src/games/hoppy_snake/coords_t.c:11: void set_coords(coords_t *dest, coords_t origin)
;	---------------------------------
; Function set_coords
; ---------------------------------
_set_coords::
;src/games/hoppy_snake/coords_t.c:13: memcpy(dest->values, origin.values, 2 * sizeof(size_t));
	ldhl	sp,	#2
	ld	c, l
	ld	b, h
	ld	hl, #0x0004
	push	hl
	call	_memcpy
;src/games/hoppy_snake/coords_t.c:14: }
	pop	hl
	add	sp, #4
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
