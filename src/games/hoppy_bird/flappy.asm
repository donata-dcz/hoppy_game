;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module flappy
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _clear_all_sprites
	.globl _get_char_tile
	.globl _draw_text
	.globl _menu_font_load
	.globl _pipe_score_check
	.globl _pipe_hit_check
	.globl _update_pipes
	.globl _init_pipes
	.globl _fill_win_rect
	.globl _fill_bkg_rect
	.globl _set_sprite_data
	.globl _set_win_tiles
	.globl _set_bkg_data
	.globl _display_off
	.globl _joypad
	.globl _FlappyBirdTiles
	.globl _flappy_bg_tiles
	.globl _flappy_get_state
	.globl _flappy_init
	.globl _flappy_update
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_flappy_get_state_state_10000_156:
	.ds 4
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
;src/games/hoppy_bird/flappy.c:17: flappy_t *flappy_get_state(void)
;	---------------------------------
; Function flappy_get_state
; ---------------------------------
_flappy_get_state::
;src/games/hoppy_bird/flappy.c:21: return &state;
	ld	bc, #_flappy_get_state_state_10000_156
;src/games/hoppy_bird/flappy.c:22: }
	ret
_flappy_bg_tiles:
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
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
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
_FlappyBirdTiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xc4	; 196
	.db #0x84	; 132
	.db #0xa6	; 166
	.db #0xc2	; 194
	.db #0xba	; 186
	.db #0xc6	; 198
	.db #0x44	; 68	'D'
	.db #0x7c	; 124
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x88	; 136
	.db #0x88	; 136
	.db #0xd4	; 212
	.db #0x94	; 148
	.db #0xd4	; 212
	.db #0x94	; 148
	.db #0x64	; 100	'd'
	.db #0x44	; 68	'D'
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7f	; 127
	.db #0x41	; 65	'A'
	.db #0xfe	; 254
	.db #0xbe	; 190
	.db #0x7e	; 126
	.db #0xc2	; 194
	.db #0x3c	; 60
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
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
;src/games/hoppy_bird/flappy.c:24: static void draw_score(uint8_t score)
;	---------------------------------
; Function draw_score
; ---------------------------------
_draw_score:
	add	sp, #-4
	ld	c, a
;src/games/hoppy_bird/flappy.c:28: tiles[0] = get_char_tile('0' + score / 100);
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
;src/games/hoppy_bird/flappy.c:29: tiles[1] = get_char_tile('0' + (score / 10) % 10);
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
;src/games/hoppy_bird/flappy.c:30: tiles[2] = get_char_tile('0' + score % 10);
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
;src/games/hoppy_bird/flappy.c:31: set_win_tiles(0, 0, 3, 1, tiles);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x103
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
;src/games/hoppy_bird/flappy.c:32: }
	add	sp, #10
	ret
;src/games/hoppy_bird/flappy.c:34: static void init_gfx(void)
;	---------------------------------
; Function init_gfx
; ---------------------------------
_init_gfx:
;src/games/hoppy_bird/flappy.c:36: LCDC_REG = LCDCF_BG8000 | LCDCF_WIN9C00;
	ld	a, #0x50
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:37: set_bkg_data(T_SKY, FLAPPY_BG_TILES_COUNT, flappy_bg_tiles);
	ld	de, #_flappy_bg_tiles
	push	de
	ld	hl, #0x300
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_bird/flappy.c:38: BGP_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;src/games/hoppy_bird/flappy.c:39: OBP0_REG = 0xE4;
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
;src/games/hoppy_bird/flappy.c:40: fill_bkg_rect(0, 0, 32, GROUND_ROW, T_SKY);
	xor	a, a
	ld	h, a
	ld	l, #0x10
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;src/games/hoppy_bird/flappy.c:41: fill_bkg_rect(0, GROUND_ROW, 32, 2, T_GROUND);
	ld	hl, #0x102
	push	hl
	ld	hl, #0x2010
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;src/games/hoppy_bird/flappy.c:42: menu_font_load();
	call	_menu_font_load
;src/games/hoppy_bird/flappy.c:43: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:44: set_sprite_data(S_BIRD, FLAPPY_BIRD_TILES_COUNT, FlappyBirdTiles);
	ld	de, #_FlappyBirdTiles
	push	de
	ld	hl, #0x432
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/games/hoppy_bird/flappy.c:45: set_bkg_data(T_GROUND, 1, GrassTiles);
	ld	de, #_GrassTiles
	push	de
	ld	hl, #0x101
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_bird/flappy.c:46: set_bkg_data(T_PIPE_CAP, 1, PipeHeadTiles);
	ld	de, #_PipeHeadTiles
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_bird/flappy.c:47: set_bkg_data(T_PIPE_BODY, 1, PipeTailTiles);
	ld	de, #_PipeTailTiles
	push	de
	ld	hl, #0x108
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/games/hoppy_bird/flappy.c:48: set_bkg_data(T_PIPE_CAP_FLIP, 1, PipeHeadFlippedTiles);
	ld	de, #_PipeHeadFlippedTiles
	push	de
	ld	hl, #0x104
	push	hl
	call	_set_bkg_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x32
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x34
;src/games/hoppy_bird/flappy.c:51: move_sprite(SPR_BIRD, BIRD_X + 8, flappy_get_state()->bird_y + 16);
	call	_flappy_get_state
	ld	a, (bc)
	add	a, #0x10
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x30
;src/games/hoppy_bird/flappy.c:52: move_sprite(SPR_BIRD_R, BIRD_X + 16, flappy_get_state()->bird_y + 16);
	call	_flappy_get_state
	ld	a, (bc)
	add	a, #0x10
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), #0x38
;src/games/hoppy_bird/flappy.c:53: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:54: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:55: }
	ret
;src/games/hoppy_bird/flappy.c:57: static void setup_score_win(void)
;	---------------------------------
; Function setup_score_win
; ---------------------------------
_setup_score_win:
;src/games/hoppy_bird/flappy.c:59: fill_win_rect(0, 0, 20, 1, 0);
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
;src/games/hoppy_bird/flappy.c:60: WX_REG = 7;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
;src/games/hoppy_bird/flappy.c:61: WY_REG = 136;
	ld	a, #0x88
	ldh	(_WY_REG + 0), a
;src/games/hoppy_bird/flappy.c:62: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:63: }
	ret
;src/games/hoppy_bird/flappy.c:65: static void flappy_handle_input(void)
;	---------------------------------
; Function flappy_handle_input
; ---------------------------------
_flappy_handle_input:
;src/games/hoppy_bird/flappy.c:67: if (joypad() & J_A)
	call	_joypad
	bit	4, a
	ret	Z
;src/games/hoppy_bird/flappy.c:68: flappy_get_state()->bird_vy = -FLAPPY_JUMP_FORCE;
	call	_flappy_get_state
	inc	bc
	ld	a, #0xfc
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:69: }
	ret
;src/games/hoppy_bird/flappy.c:71: static void apply_gravity(void)
;	---------------------------------
; Function apply_gravity
; ---------------------------------
_apply_gravity:
	add	sp, #-5
;src/games/hoppy_bird/flappy.c:73: flappy_t *s = flappy_get_state();
;src/games/hoppy_bird/flappy.c:74: int16_t new_y = (int16_t)s->bird_y + s->bird_vy;
	call	_flappy_get_state
	pop	hl
	push	bc
	pop	de
	push	de
	ld	a, (de)
	inc	bc
	push	af
	ld	a, (bc)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (hl)
	ld	e, a
	rlca
	sbc	a, a
	ld	d, a
	pop	af
	ld	l, #0x00
	add	a, e
	ld	e, a
	ld	a, l
	adc	a, d
	ldhl	sp,	#3
	ld	(hl), e
	inc	hl
;src/games/hoppy_bird/flappy.c:76: s->bird_vy += FLAPPY_GRAVITY;
	ld	(hl-), a
	dec	hl
	ld	l, (hl)
	inc	l
	ld	a, l
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:77: if (s->bird_vy > FLAPPY_MAX_FALL)
	ld	e, l
	ld	a,#0x02
	ld	d,a
	sub	a, l
	bit	7, e
	jr	Z, 00132$
	bit	7, d
	jr	NZ, 00133$
	cp	a, a
	jr	00133$
00132$:
	bit	7, d
	jr	Z, 00133$
	scf
00133$:
	jr	NC, 00102$
;src/games/hoppy_bird/flappy.c:78: s->bird_vy = FLAPPY_MAX_FALL;
	ld	a, #0x02
	ld	(bc), a
00102$:
;src/games/hoppy_bird/flappy.c:79: if (new_y < 0)
	ldhl	sp,	#3
	ld	a, (hl+)
	bit	7, (hl)
	jr	Z, 00104$
;src/games/hoppy_bird/flappy.c:80: new_y = 0;
	dec	hl
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00104$:
;src/games/hoppy_bird/flappy.c:81: if (new_y >= FLAPPY_GROUND_Y)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	sub	a, #0x70
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C, 00106$
;src/games/hoppy_bird/flappy.c:82: new_y = FLAPPY_GROUND_Y;
	dec	hl
	ld	a, #0x70
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
00106$:
;src/games/hoppy_bird/flappy.c:83: s->bird_y = (uint8_t)new_y;
	ldhl	sp,	#3
	ld	a, (hl)
	pop	hl
	push	hl
	ld	(hl), a
;src/games/hoppy_bird/flappy.c:84: move_sprite(SPR_BIRD, BIRD_X + 8, s->bird_y + 16);
	add	a, #0x10
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x30
;src/games/hoppy_bird/flappy.c:85: move_sprite(SPR_BIRD_R, BIRD_X + 16, s->bird_y + 16);
	pop	de
	push	de
	ld	a, (de)
	add	a, #0x10
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), #0x38
;src/games/hoppy_bird/flappy.c:85: move_sprite(SPR_BIRD_R, BIRD_X + 16, s->bird_y + 16);
;src/games/hoppy_bird/flappy.c:86: }
	add	sp, #5
	ret
;src/games/hoppy_bird/flappy.c:88: static uint8_t check_collision(void)
;	---------------------------------
; Function check_collision
; ---------------------------------
_check_collision:
;src/games/hoppy_bird/flappy.c:90: flappy_t *s = flappy_get_state();
	call	_flappy_get_state
;src/games/hoppy_bird/flappy.c:92: if (s->bird_y >= FLAPPY_GROUND_Y)
	ld	a, (bc)
	cp	a, #0x70
	jp	C, _pipe_hit_check
;src/games/hoppy_bird/flappy.c:93: return 1;
	ld	a, #0x01
;src/games/hoppy_bird/flappy.c:94: return pipe_hit_check(s->bird_y);
;src/games/hoppy_bird/flappy.c:95: }
	ret
;src/games/hoppy_bird/flappy.c:97: void flappy_init(void)
;	---------------------------------
; Function flappy_init
; ---------------------------------
_flappy_init::
;src/games/hoppy_bird/flappy.c:99: flappy_get_state()->bird_y = BIRD_INIT_Y;
	call	_flappy_get_state
	ld	a, #0x3c
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:100: flappy_get_state()->bird_vy = 0;
	call	_flappy_get_state
	inc	bc
	xor	a, a
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:101: flappy_get_state()->ready = 0;
	call	_flappy_get_state
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:102: flappy_get_state()->score = 0;
	call	_flappy_get_state
	inc	bc
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:103: DISPLAY_OFF;
	call	_display_off
;src/games/hoppy_bird/flappy.c:104: clear_all_sprites();
	call	_clear_all_sprites
;src/games/hoppy_bird/flappy.c:105: init_gfx();
	call	_init_gfx
;src/games/hoppy_bird/flappy.c:106: setup_score_win();
	call	_setup_score_win
;src/games/hoppy_bird/flappy.c:107: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_bird/flappy.c:108: init_pipes();
	call	_init_pipes
;src/games/hoppy_bird/flappy.c:109: draw_score(0);
	xor	a, a
	call	_draw_score
;src/games/hoppy_bird/flappy.c:110: draw_text(7, 5, "PRESS A");
	ld	de, #___str_0
	push	de
	ld	e, #0x05
	ld	a, #0x07
	call	_draw_text
;src/games/hoppy_bird/flappy.c:111: }
	ret
___str_0:
	.ascii "PRESS A"
	.db 0x00
;src/games/hoppy_bird/flappy.c:113: uint8_t flappy_update(void)
;	---------------------------------
; Function flappy_update
; ---------------------------------
_flappy_update::
;src/games/hoppy_bird/flappy.c:115: flappy_t *s = flappy_get_state();
	call	_flappy_get_state
;src/games/hoppy_bird/flappy.c:117: if (!s->ready) {
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jr	NZ, 00104$
;src/games/hoppy_bird/flappy.c:118: if (joypad() & J_A) {
	call	_joypad
	bit	4, a
	jr	Z, 00102$
;src/games/hoppy_bird/flappy.c:119: fill_bkg_rect(7, 5, 7, 1, T_SKY);
	push	hl
	xor	a, a
	ld	h, a
	ld	l, #0x01
	push	hl
	ld	hl, #0x705
	push	hl
	ld	a, #0x07
	push	af
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	pop	hl
;src/games/hoppy_bird/flappy.c:120: s->ready = 1;
	ld	(hl), #0x01
00102$:
;src/games/hoppy_bird/flappy.c:122: return 0;
	xor	a, a
	ret
00104$:
;src/games/hoppy_bird/flappy.c:124: update_pipes();
	push	bc
	call	_update_pipes
;src/games/hoppy_bird/flappy.c:125: flappy_handle_input();
	call	_flappy_handle_input
;src/games/hoppy_bird/flappy.c:126: apply_gravity();
	call	_apply_gravity
;src/games/hoppy_bird/flappy.c:127: if (pipe_score_check()) {
	call	_pipe_score_check
	pop	bc
	or	a, a
	jp	Z, _check_collision
;src/games/hoppy_bird/flappy.c:128: s->score++;
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/games/hoppy_bird/flappy.c:129: draw_score(s->score);
	call	_draw_score
;src/games/hoppy_bird/flappy.c:131: return check_collision();
;src/games/hoppy_bird/flappy.c:132: }
	jp	_check_collision
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
