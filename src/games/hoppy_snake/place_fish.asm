;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module place_fish
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _set_bkg_tiles
	.globl _place_fish
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
;src/games/hoppy_snake/place_fish.c:18: static size_t get_fish_index(snake_board_t *game_board)
;	---------------------------------
; Function get_fish_index
; ---------------------------------
_get_fish_index:
	add	sp, #-4
	push	de
;src/games/hoppy_snake/place_fish.c:23: new_fish_index = ((size_t)rand()) % BOARD_SIZE;
	call	_rand
	xor	a, a
	ld	bc, #0x0154
	ld	d, a
;src/games/hoppy_snake/place_fish.c:24: for (size_t i = 0; i <= new_fish_index; ++i) {
	call	__moduint
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00110$:
	ldhl	sp,	#2
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00108$
;src/games/hoppy_snake/place_fish.c:25: if (i >= BOARD_SIZE && skip_counter == BOARD_SIZE)
	ldhl	sp,	#2
	ld	a, (hl+)
	sub	a, #0x54
	ld	a, (hl)
	sbc	a, #0x01
	ld	a, #0x00
	rla
	ld	e, a
	bit	0, e
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	sub	a, #0x54
	jr	NZ, 00102$
	inc	hl
	ld	a, (hl)
	dec	a
	jr	NZ, 00102$
;src/games/hoppy_snake/place_fish.c:26: return FAILURE;
	ld	bc, #0xffff
	jr	00112$
00102$:
;src/games/hoppy_snake/place_fish.c:27: if (i >= BOARD_SIZE) {
	bit	0, e
	jr	NZ, 00105$
;src/games/hoppy_snake/place_fish.c:28: i = 0;
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
;src/games/hoppy_snake/place_fish.c:29: new_fish_index = rand() % (BOARD_SIZE - skip_counter);
	call	_rand
	ld	b, e
	ld	de, #0x0154
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	c, e
	ld	e, b
	ld	d, #0x00
	ld	b, a
	call	__moduint
00105$:
;src/games/hoppy_snake/place_fish.c:31: if ((*game_board)[i] != SNAKE_VOID) {
	pop	de
	push	de
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	dec	a
	jr	Z, 00111$
;src/games/hoppy_snake/place_fish.c:32: skip_counter++;
	ldhl	sp,	#4
	inc	(hl)
	jr	NZ, 00159$
	inc	hl
	inc	(hl)
00159$:
;src/games/hoppy_snake/place_fish.c:33: new_fish_index++;
	inc	bc
00111$:
;src/games/hoppy_snake/place_fish.c:24: for (size_t i = 0; i <= new_fish_index; ++i) {
	ldhl	sp,	#2
	inc	(hl)
	jr	NZ, 00110$
	inc	hl
	inc	(hl)
	jr	00110$
00108$:
;src/games/hoppy_snake/place_fish.c:36: return new_fish_index;
00112$:
;src/games/hoppy_snake/place_fish.c:37: }
	add	sp, #6
	ret
;src/games/hoppy_snake/place_fish.c:39: int place_fish(snake_game_t *game)
;	---------------------------------
; Function place_fish
; ---------------------------------
_place_fish::
	dec	sp
;src/games/hoppy_snake/place_fish.c:41: uint8_t heart_tile_index = SNAKE_BGHEART_ASSET;
	ldhl	sp,	#0
	ld	(hl), #0x02
;src/games/hoppy_snake/place_fish.c:42: size_t new_fish_index = get_fish_index(&(game->board));
	ld	a, e
	ld	c, d
	push	de
	ld	e, a
	ld	d, c
	call	_get_fish_index
;src/games/hoppy_snake/place_fish.c:44: game->board[new_fish_index] = FISH;
	pop	hl
	add	hl, bc
	ld	(hl), #0x02
;src/games/hoppy_snake/place_fish.c:46: (uint8_t)new_fish_index / BOARD_WIDTH, 1, 1, &heart_tile_index);
	push	bc
	ld	e, #0x14
	ld	a, c
	call	__divuchar
	ld	d, c
	pop	bc
;src/games/hoppy_snake/place_fish.c:45: set_bkg_tiles((uint8_t)new_fish_index % BOARD_WIDTH,
	push	de
	ld	e, #0x14
	ld	a, c
	call	__moduchar
	pop	de
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	e, c
	push	de
	call	_set_bkg_tiles
	add	sp, #6
;src/games/hoppy_snake/place_fish.c:47: return SUCCESS;
	ld	bc, #0x0000
;src/games/hoppy_snake/place_fish.c:48: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
