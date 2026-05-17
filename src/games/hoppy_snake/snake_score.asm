;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module snake_score
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _set_score
	.globl _init_snake_score
	.globl _increment_score
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
;src/games/hoppy_snake/snake_score.c:13: static void show_score(char snake_score)
;	---------------------------------
; Function show_score
; ---------------------------------
_show_score:
	add	sp, #-6
	ldhl	sp,	#1
	ld	(hl), a
;src/games/hoppy_snake/snake_score.c:15: uint8_t *vram = get_bkg_xy_addr(0 + SNAKE_SCORE_W - 1, BOARD_HEIGHT);
	ld	e, #0x11
	ld	a, #0x02
	call	_get_bkg_xy_addr
	ldhl	sp,	#3
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_snake/snake_score.c:18: for (char i = SNAKE_SCORE_W - 1; i >= 0; --i) {
	ldhl	sp,	#5
	ld	(hl), #0x02
00103$:
	ldhl	sp,	#5
	ld	a, (hl)
	bit	7, a
	jr	NZ, 00105$
;src/games/hoppy_snake/snake_score.c:19: nth_digit = snake_score % 10;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	push	de
	ld	bc, #0x000a
	call	__modsint
	pop	de
	ldhl	sp,	#2
	ld	(hl), c
;src/games/hoppy_snake/snake_score.c:20: snake_score = snake_score / 10;
	ld	bc, #0x000a
	call	__divsint
	pop	hl
	push	bc
	ldhl	sp,	#0
	ld	a, (hl+)
;src/games/hoppy_snake/snake_score.c:21: set_vram_byte(vram--, SNAKE_BGSCORE_ASSET + nth_digit);
	ld	(hl+), a
	inc	(hl)
	inc	(hl)
	inc	(hl)
	inc	(hl)
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	a, d
	ld	(hl-), a
	dec	hl
	ld	a, (hl)
	ld	e, c
	ld	d, b
	call	_set_vram_byte
;src/games/hoppy_snake/snake_score.c:18: for (char i = SNAKE_SCORE_W - 1; i >= 0; --i) {
	ldhl	sp,	#5
	dec	(hl)
	jr	00103$
00105$:
;src/games/hoppy_snake/snake_score.c:23: }
	add	sp, #6
	ret
;src/games/hoppy_snake/snake_score.c:25: void set_score(char *original_score, char new_score)
;	---------------------------------
; Function set_score
; ---------------------------------
_set_score::
;src/games/hoppy_snake/snake_score.c:27: *original_score = new_score;
	ld	(de), a
;src/games/hoppy_snake/snake_score.c:28: show_score(*original_score);
;src/games/hoppy_snake/snake_score.c:29: }
	jp	_show_score
;src/games/hoppy_snake/snake_score.c:31: void init_snake_score(char *snake_score)
;	---------------------------------
; Function init_snake_score
; ---------------------------------
_init_snake_score::
;src/games/hoppy_snake/snake_score.c:33: uint8_t *vram = get_bkg_xy_addr(SNAKE_SCORE_W, BOARD_HEIGHT);
	push	de
	ld	e, #0x11
	ld	a, #0x03
	call	_get_bkg_xy_addr
	pop	de
;src/games/hoppy_snake/snake_score.c:35: set_score(snake_score, 0);
	push	bc
	xor	a, a
	call	_set_score
	pop	bc
;src/games/hoppy_snake/snake_score.c:36: for (char i = SNAKE_SCORE_W; i < BOARD_WIDTH; ++i)
	ld	l, #0x03
00103$:
	ld	a, l
	sub	a, #0x14
	ret	NC
;src/games/hoppy_snake/snake_score.c:37: set_vram_byte(vram++, SNAKE_BGBACKGROUND_ASSET);
	ld	e, c
	ld	d, b
	inc	bc
	push	hl
	ld	a, #0x03
	call	_set_vram_byte
	pop	hl
;src/games/hoppy_snake/snake_score.c:36: for (char i = SNAKE_SCORE_W; i < BOARD_WIDTH; ++i)
	inc	l
;src/games/hoppy_snake/snake_score.c:38: }
	jr	00103$
;src/games/hoppy_snake/snake_score.c:40: void increment_score(char *original_score)
;	---------------------------------
; Function increment_score
; ---------------------------------
_increment_score::
;src/games/hoppy_snake/snake_score.c:42: set_score(original_score, *original_score + 1);
	ld	a, (de)
	inc	a
;src/games/hoppy_snake/snake_score.c:43: }
	jp	_set_score
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
