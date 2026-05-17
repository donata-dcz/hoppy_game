;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module init_snake_game
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clear_all_sprites
	.globl _init_snake_score
	.globl _initarand
	.globl _memset
	.globl _place_fish
	.globl _get_tile_at
	.globl _set_coords
	.globl _init_bkg
	.globl _set_sprite_data
	.globl _set_bkg_data
	.globl _vsync
	.globl _init_snake_game
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
;src/games/hoppy_snake/init_snake_game.c:21: static void init_snake_background(void)
;	---------------------------------
; Function init_snake_background
; ---------------------------------
_init_snake_background:
;src/games/hoppy_snake/init_snake_game.c:23: set_bkg_data(SNAKE_BGBODY_ASSET, 1, SnakeBodyTiles);
	ld	de, #_SnakeBodyTiles
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_snake/init_snake_game.c:24: set_bkg_data(SNAKE_BGEMPTY_ASSET, 1, EmptyTile);
	ld	de, #_EmptyTile
	push	de
	xor	a, a
	inc	a
	push	af
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_snake/init_snake_game.c:25: set_bkg_data(SNAKE_BGHEART_ASSET, 1, HeartTiles);
	ld	de, #_HeartTiles
	push	de
	ld	hl, #0x102
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_snake/init_snake_game.c:26: set_bkg_data(SNAKE_BGBACKGROUND_ASSET, 1, BackgroundTile);
	ld	de, #_BackgroundTile
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_snake/init_snake_game.c:27: set_bkg_data(SNAKE_BGSCORE_ASSET, DIGIT_TILES_COUNT, DigitTiles);
	ld	de, #_DigitTiles
	push	de
	ld	hl, #0xa04
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_snake/init_snake_game.c:28: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_snake/init_snake_game.c:29: }
	ret
_SnakeHeadTiles:
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xbd	; 189
	.db #0xa5	; 165
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x99	; 153
	.db #0xc3	; 195
	.db #0xbd	; 189
	.db #0xa5	; 165
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x8d	; 141
	.db #0x83	; 131
	.db #0x8d	; 141
	.db #0x83	; 131
	.db #0x69	; 105	'i'
	.db #0x6b	; 107	'k'
	.db #0x12	; 18
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x96	; 150
	.db #0xd6	; 214
	.db #0xb1	; 177
	.db #0xc1	; 193
	.db #0xb1	; 177
	.db #0xc1	; 193
	.db #0x96	; 150
	.db #0xd6	; 214
	.db #0x48	; 72	'H'
	.db #0x68	; 104	'h'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
_HeartTiles:
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0xd9	; 217
	.db #0xff	; 255
	.db #0xb1	; 177
	.db #0xc3	; 195
	.db #0xb1	; 177
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0x42	; 66	'B'
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
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
_SnakeBodyTiles:
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0x81	; 129
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
_DigitTiles:
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x6e	; 110	'n'
	.db #0x6e	; 110	'n'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
_BackgroundTile:
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
	.db #0x55	; 85	'U'
	.db #0xaa	; 170
	.db #0xaa	; 170
	.db #0x55	; 85	'U'
;src/games/hoppy_snake/init_snake_game.c:31: static void init_snake_sprites(void)
;	---------------------------------
; Function init_snake_sprites
; ---------------------------------
_init_snake_sprites:
;src/games/hoppy_snake/init_snake_game.c:33: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_snake/init_snake_game.c:34: set_sprite_data(0, 4, SnakeHeadTiles);
	ld	de, #_SnakeHeadTiles
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x01
	ld	hl, #(_shadow_OAM + 10)
	ld	(hl), #0x02
	ld	hl, #(_shadow_OAM + 14)
	ld	(hl), #0x03
;src/games/hoppy_snake/init_snake_game.c:39: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_snake/init_snake_game.c:40: }
	ret
;src/games/hoppy_snake/init_snake_game.c:42: int init_snake_game(snake_game_t *snake_game)
;	---------------------------------
; Function init_snake_game
; ---------------------------------
_init_snake_game::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/games/hoppy_snake/init_snake_game.c:45: coords_t snake_coords = {{BOARD_HEIGHT / 2, BOARD_WIDTH / 2}};
	ldhl	sp,	#0
	ld	a, #0x08
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, #0x0a
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/games/hoppy_snake/init_snake_game.c:47: clear_all_sprites();
	call	_clear_all_sprites
;src/games/hoppy_snake/init_snake_game.c:48: init_snake_background();
	call	_init_snake_background
;src/games/hoppy_snake/init_snake_game.c:49: init_snake_sprites();
	call	_init_snake_sprites
;src/games/hoppy_snake/init_snake_game.c:50: init_bkg(0);
	xor	a, a
	push	af
	inc	sp
	call	_init_bkg
	inc	sp
;src/games/hoppy_snake/init_snake_game.c:51: vsync();
	call	_vsync
;src/games/hoppy_snake/init_snake_game.c:52: init_snake_score(&(snake_game->score));
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x015e
	add	hl, bc
	ld	e, l
	ld	d, h
	call	_init_snake_score
;src/games/hoppy_snake/init_snake_game.c:53: initarand((uint16_t)&snake_game);
	ldhl	sp,	#4
	push	hl
	call	_initarand
	pop	hl
;src/games/hoppy_snake/init_snake_game.c:54: memset(snake_game, SNAKE_VOID, sizeof(snake_game_t));
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	de, #0x015f
	push	de
	ld	de, #0x0001
	push	de
	push	bc
	call	_memset
	add	sp, #6
;src/games/hoppy_snake/init_snake_game.c:55: set_coords(&(snake_game->head_coords), snake_coords);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0156
	add	hl, bc
	ld	e, l
	ld	d, h
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
	call	_set_coords
;src/games/hoppy_snake/init_snake_game.c:56: set_coords(&(snake_game->tail_tip_coords), snake_game->head_coords);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl,#0x159
	add	hl,bc
	ld	a, c
	add	a, #0x5a
	ld	e, a
	ld	a, b
	adc	a, #0x01
	ld	d, a
	ld	a, (hl-)
	ld	b, a
	ld	a, (hl-)
	ld	c, a
	push	bc
	ld	a, (hl-)
	ld	b, a
	ld	c, (hl)
	push	bc
	call	_set_coords
;src/games/hoppy_snake/init_snake_game.c:57: snake_game->unflold = (SNAKE_START_SIZE - 1);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0154
	add	hl, bc
	ld	a, #0x02
	ld	(hl+), a
	ld	(hl), #0x00
;src/games/hoppy_snake/init_snake_game.c:58: snake_head = get_tile_at(&(snake_game->board), snake_game->head_coords);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl,#0x159
	add	hl,de
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
;src/games/hoppy_snake/init_snake_game.c:59: *snake_head = SNAKE_START_DIRECTION;
	ld	a, #0x04
	ld	(bc), a
;src/games/hoppy_snake/init_snake_game.c:60: place_fish(snake_game);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_place_fish
;src/games/hoppy_snake/init_snake_game.c:61: snake_game->score = 0;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x015e
	add	hl, bc
;src/games/hoppy_snake/init_snake_game.c:62: return SUCCESS;
	ld	bc, #0x0000
	ld	(hl), c
;src/games/hoppy_snake/init_snake_game.c:63: }
	add	sp, #6
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
