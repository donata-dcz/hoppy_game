;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module score
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fill_win_rect
	.globl _set_win_tiles
	.globl _get_char_tile
	.globl _draw_hoppy_score
	.globl _setup_score_window
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
;src/games/hoppy_run/score.c:11: void draw_hoppy_score(uint8_t score)
;	---------------------------------
; Function draw_hoppy_score
; ---------------------------------
_draw_hoppy_score::
	add	sp, #-4
	ld	c, a
;src/games/hoppy_run/score.c:15: tiles[0] = get_char_tile('0' + score / 100);
	ldhl	sp,	#3
	ld	(hl), c
	ld	e, #0x64
	ld	a, (hl)
	call	__divuchar
	ld	a, c
	add	a, #0x30
	call	_get_char_tile
	ldhl	sp,	#0
	ld	(hl), a
;src/games/hoppy_run/score.c:16: tiles[1] = get_char_tile('0' + (score / 10) % 10);
	ld	e, #0x0a
	ldhl	sp,	#3
	ld	a, (hl)
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x30
	call	_get_char_tile
	ldhl	sp,	#1
;src/games/hoppy_run/score.c:17: tiles[2] = get_char_tile('0' + score % 10);
	ld	(hl+), a
	inc	hl
	ld	e, #0x0a
	ld	a, (hl)
	call	__moduchar
	ld	a, c
	add	a, #0x30
	call	_get_char_tile
	ldhl	sp,	#2
	ld	(hl), a
;src/games/hoppy_run/score.c:18: set_win_tiles(0, 0, 3, 1, tiles);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
;src/games/hoppy_run/score.c:19: }
	add	sp, #10
	ret
;src/games/hoppy_run/score.c:21: void setup_score_window(void)
;	---------------------------------
; Function setup_score_window
; ---------------------------------
_setup_score_window::
;src/games/hoppy_run/score.c:23: fill_win_rect(0, 0, 20, 1, 0);
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_win_rect
	add	sp, #5
;src/games/hoppy_run/score.c:24: WX_REG = 7;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
;src/games/hoppy_run/score.c:25: WY_REG = 136;
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/games/hoppy_run/score.c:26: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/score.c:27: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
