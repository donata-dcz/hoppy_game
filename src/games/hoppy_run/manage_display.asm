;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module manage_display
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _LifesTiles
	.globl _EarthTiles
	.globl _CatTiles
	.globl _draw_lives
	.globl _display_background
	.globl _display_hoppy
	.globl _display_pipe
	.globl _draw_pipe_at
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
;src/games/hoppy_run/manage_display.c:17: void draw_lives(uint8_t lives)
;	---------------------------------
; Function draw_lives
; ---------------------------------
_draw_lives::
;src/games/hoppy_run/manage_display.c:19: set_sprite_tile(5, LIFES_SPRITE_OFFSET + (MAX_LIVES - lives) * 2 + 2);
	ld	c, a
	ld	a, #0x03
	sub	a, c
	add	a, a
	add	a, #0x12
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 22)
	ld	(hl), c
;src/games/hoppy_run/manage_display.c:19: set_sprite_tile(5, LIFES_SPRITE_OFFSET + (MAX_LIVES - lives) * 2 + 2);
;src/games/hoppy_run/manage_display.c:20: }
	ret
_CatTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x5b	; 91
	.db #0x7b	; 123
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0f	; 15
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x6c	; 108	'l'
	.db #0xac	; 172
	.db #0x9a	; 154
	.db #0x06	; 6
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0xfa	; 250
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x5b	; 91
	.db #0x7b	; 123
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x6c	; 108	'l'
	.db #0xac	; 172
	.db #0x9a	; 154
	.db #0x06	; 6
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x18	; 24
	.db #0x08	; 8
	.db #0xe8	; 232
	.db #0x18	; 24
	.db #0x58	; 88	'X'
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x50	; 80	'P'
	.db #0x70	; 112	'p'
	.db #0x51	; 81	'Q'
	.db #0x71	; 113	'q'
	.db #0x5b	; 91
	.db #0x7b	; 123
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1c	; 28
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0xba	; 186
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0x84	; 132
	.db #0x6c	; 108	'l'
	.db #0xac	; 172
	.db #0x9a	; 154
	.db #0x06	; 6
	.db #0x82	; 130
	.db #0x02	; 2
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x08	; 8
	.db #0xd8	; 216
	.db #0x38	; 56	'8'
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_GrassTiles:
	.db #0xa5	; 165
	.db #0xa5	; 165
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
_EarthTiles:
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x00	; 0
_EmptyTile:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_PipeHeadTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xff	; 255
_PipeTailTiles:
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
	.db #0x5a	; 90	'Z'
	.db #0x62	; 98	'b'
_PipeHeadFlippedTiles:
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0x81	; 129
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_SleepingHoppy:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x52	; 82	'R'
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x84	; 132
	.db #0xc4	; 196
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1b	; 27
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xbc	; 188
	.db #0xbc	; 188
	.db #0xc2	; 194
	.db #0xfe	; 254
	.db #0xc5	; 197
	.db #0x43	; 67	'C'
	.db #0x21	; 33
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x43	; 67	'C'
	.db #0xa5	; 165
	.db #0x63	; 99	'c'
	.db #0x42	; 66	'B'
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
_LifesTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x44	; 68	'D'
	.db #0x44	; 68	'D'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x08	; 8
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
;src/games/hoppy_run/manage_display.c:22: void display_background(void)
;	---------------------------------
; Function display_background
; ---------------------------------
_display_background::
	add	sp, #-3
;src/games/hoppy_run/manage_display.c:24: uint8_t empty_tile = TILE_EMPTY;
	ldhl	sp,	#0
;src/games/hoppy_run/manage_display.c:25: uint8_t grass_tile = TILE_GRASS;
	xor	a, a
	ld	(hl+), a
;src/games/hoppy_run/manage_display.c:26: uint8_t earth_tile = TILE_EARTH;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x02
;src/games/hoppy_run/manage_display.c:28: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;src/games/hoppy_run/manage_display.c:29: set_bkg_data(0, 1, EmptyTile);
	ld	de, #_EmptyTile
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:30: set_bkg_data(1, 1, GrassTiles);
	ld	de, #_GrassTiles
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:31: set_bkg_data(2, 1, EarthTiles);
	ld	de, #_EarthTiles
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:32: for (uint8_t y = 0; y < 18; y++)
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x12
	jr	NC, 00102$
;src/games/hoppy_run/manage_display.c:33: for (uint8_t x = 0; x < 32; x++)
	ld	e, #0x00
00107$:
	ld	a, e
	sub	a, #0x20
	jr	NC, 00111$
;src/games/hoppy_run/manage_display.c:34: set_bkg_tiles(x, y, 1, 1, &empty_tile);
	push	de
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ld	d, c
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/games/hoppy_run/manage_display.c:33: for (uint8_t x = 0; x < 32; x++)
	inc	e
	jr	00107$
00111$:
;src/games/hoppy_run/manage_display.c:32: for (uint8_t y = 0; y < 18; y++)
	inc	c
	jr	00110$
00102$:
;src/games/hoppy_run/manage_display.c:35: for (uint8_t x = 0; x < 32; x++)
	ld	b, #0x00
00113$:
	ld	a, b
	sub	a, #0x20
	jr	NC, 00103$
;src/games/hoppy_run/manage_display.c:36: set_bkg_tiles(x, 14, 1, 1, &grass_tile);
	ldhl	sp,	#1
	push	hl
	ld	hl, #0x101
	push	hl
	ld	a, #0x0e
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/games/hoppy_run/manage_display.c:35: for (uint8_t x = 0; x < 32; x++)
	inc	b
	jr	00113$
00103$:
;src/games/hoppy_run/manage_display.c:37: for (uint8_t y = 15; y < 18; y++)
	ld	c, #0x0f
00119$:
	ld	a, c
	sub	a, #0x12
	jr	NC, 00121$
;src/games/hoppy_run/manage_display.c:38: for (uint8_t x = 0; x < 32; x++)
	ld	b, #0x00
00116$:
	ld	a, b
	sub	a, #0x20
	jr	NC, 00120$
;src/games/hoppy_run/manage_display.c:39: set_bkg_tiles(x, y, 1, 1, &earth_tile);
	ldhl	sp,	#2
	push	hl
	ld	hl, #0x101
	push	hl
	ld	a, c
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;src/games/hoppy_run/manage_display.c:38: for (uint8_t x = 0; x < 32; x++)
	inc	b
	jr	00116$
00120$:
;src/games/hoppy_run/manage_display.c:37: for (uint8_t y = 15; y < 18; y++)
	inc	c
	jr	00119$
00121$:
;src/games/hoppy_run/manage_display.c:40: }
	add	sp, #3
	ret
;src/games/hoppy_run/manage_display.c:42: void display_hoppy(input_t *input, uint8_t lives)
;	---------------------------------
; Function display_hoppy
; ---------------------------------
_display_hoppy::
	dec	sp
	ld	c, e
	ld	b, d
	ldhl	sp,	#0
	ld	(hl), a
;src/games/hoppy_run/manage_display.c:44: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/manage_display.c:45: set_sprite_data(0, 12, CatTiles);
	ld	de, #_CatTiles
	push	de
	ld	hl, #0xc00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:46: set_sprite_data(12, 4, SleepingHoppy);
	ld	de, #_SleepingHoppy
	push	de
	ld	hl, #0x40c
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:47: set_sprite_data(LIFES_SPRITE_OFFSET, LIFES_TILE_COUNT, LifesTiles);
	ld	de, #_LifesTiles
	push	de
	ld	hl, #0x810
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:48: move_sprite(0, CAT_X, (uint8_t)input->cat_y);
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	e, a
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x28
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;src/games/hoppy_run/manage_display.c:50: move_sprite(1, CAT_X + 8, (uint8_t)input->cat_y);
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x02
	ld	(hl-), a
	dec	hl
	ld	a, (bc)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl+), a
	ld	(hl), #0x30
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 10)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x0c
	ld	(hl-), a
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x0e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 14)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x0e
	ld	(hl-), a
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x12
	ld	(hl+), a
	ld	(hl), #0x16
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 18)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x10
	ld	(hl-), a
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x16
	ld	(hl+), a
	ld	(hl), #0x22
;src/games/hoppy_run/manage_display.c:57: draw_lives(lives);
	ldhl	sp,	#0
	ld	a, (hl)
	call	_draw_lives
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 20)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), #0x16
	inc	hl
	ld	(hl), #0x2a
;src/games/hoppy_run/manage_display.c:58: move_sprite(5, 42, 22);
;src/games/hoppy_run/manage_display.c:59: }
	inc	sp
	ret
;src/games/hoppy_run/manage_display.c:61: void display_pipe(void)
;	---------------------------------
; Function display_pipe
; ---------------------------------
_display_pipe::
;src/games/hoppy_run/manage_display.c:63: set_bkg_data(TILE_PIPE_HEAD, 1, PipeHeadTiles);
	ld	de, #_PipeHeadTiles
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:64: set_bkg_data(TILE_PIPE_BODY, 1, PipeTailTiles);
	ld	de, #_PipeTailTiles
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_run/manage_display.c:65: }
	ret
;src/games/hoppy_run/manage_display.c:67: void draw_pipe_at(uint8_t col, uint8_t height, bool erase)
;	---------------------------------
; Function draw_pipe_at
; ---------------------------------
_draw_pipe_at::
	add	sp, #-3
	ldhl	sp,	#2
;src/games/hoppy_run/manage_display.c:70: uint8_t tile = 0;
	ld	(hl-), a
	dec	hl
	ld	b, e
	ld	(hl), #0x00
;src/games/hoppy_run/manage_display.c:72: for (uint8_t h = 0; h < height; h++) {
	ld	e, #0x00
00106$:
	ld	a, e
	sub	a, b
	jr	NC, 00108$
;src/games/hoppy_run/manage_display.c:73: row = PIPE_BASE_ROW - h;
	ld	c, e
	ld	a, #0x0d
	sub	a, c
	ldhl	sp,	#1
;src/games/hoppy_run/manage_display.c:74: tile = 0;
	ld	(hl-), a
	ld	(hl), #0x00
;src/games/hoppy_run/manage_display.c:75: if (erase)
	ldhl	sp,	#5
	bit	0, (hl)
	jr	Z, 00102$
;src/games/hoppy_run/manage_display.c:76: tile = TILE_EMPTY;
	ldhl	sp,	#0
	ld	(hl), #0x00
	jr	00103$
00102$:
;src/games/hoppy_run/manage_display.c:78: tile = (h == height - 1) ? TILE_PIPE_HEAD : TILE_PIPE_BODY;
	ld	l, b
	xor	a, a
	ld	h, a
	dec	hl
	ld	c, e
	ld	d, #0x00
	ld	a, l
	sub	a, c
	jr	NZ, 00110$
	ld	a, h
	sub	a, d
	ld	a, #0x03
	jr	Z, 00111$
00110$:
	ld	a, #0x04
00111$:
	ldhl	sp,	#0
	ld	(hl), a
00103$:
;src/games/hoppy_run/manage_display.c:79: set_bkg_tiles(col, row, 1, 1, &tile);
	push	de
	ld	hl, #2
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/games/hoppy_run/manage_display.c:72: for (uint8_t h = 0; h < height; h++) {
	inc	e
	jr	00106$
00108$:
;src/games/hoppy_run/manage_display.c:81: }
	add	sp, #3
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
