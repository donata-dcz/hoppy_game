;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module end_game
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _game_over_screen
	.globl _draw_text
	.globl _menu_font_load
	.globl _load_scores
	.globl _save_score
	.globl _init_menu
	.globl _launch_selected_game
	.globl _handle_menu_input
	.globl _draw_menu
	.globl _init_bkg
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _vsync
	.globl _joypad
	.globl _CheckerBoardTiles
	.globl _run_hoppy_game
	.globl _checkerboard_wipe_transition
	.globl _clear_all_sprites
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
;src/utils/end_game.c:15: static bool handle_keys_menu(void)
;	---------------------------------
; Function handle_keys_menu
; ---------------------------------
_handle_keys_menu:
;src/utils/end_game.c:19: while (joypad())
00101$:
	call	_joypad
	or	a, a
	jr	Z, 00109$
;src/utils/end_game.c:20: vsync();
	call	_vsync
	jr	00101$
;src/utils/end_game.c:21: while (1) {
00109$:
;src/utils/end_game.c:22: vsync();
	call	_vsync
;src/utils/end_game.c:23: keys = joypad();
	call	_joypad
;src/utils/end_game.c:24: if (keys & J_START)
	bit	7, a
	jr	Z, 00105$
;src/utils/end_game.c:25: return true;
	ld	a, #0x01
	ret
00105$:
;src/utils/end_game.c:26: if (keys & J_SELECT)
	bit	6, a
	jr	Z, 00109$
;src/utils/end_game.c:27: return false;
	xor	a, a
;src/utils/end_game.c:29: }
	ret
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
_CheckerBoardTiles:
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
	.db #0x55	; 85	'U'
;src/utils/end_game.c:31: static void print_game_score(uint8_t id)
;	---------------------------------
; Function print_game_score
; ---------------------------------
_print_game_score:
;src/utils/end_game.c:33: if (id == GAME_SNAKE)
	or	a, a
	jr	NZ, 00105$
;src/utils/end_game.c:34: draw_text(5, 2, "HOPPY SNAKE");
	ld	de, #___str_0
	push	de
	ld	e, #0x02
	ld	a, #0x05
	call	_draw_text
	ret
00105$:
;src/utils/end_game.c:35: else if (id == GAME_FLAPPY)
	dec	a
	jr	NZ, 00102$
;src/utils/end_game.c:36: draw_text(5, 2, "HOPPY BIRD");
	ld	de, #___str_1
	push	de
	ld	e, #0x02
	ld	a, #0x05
	call	_draw_text
	ret
00102$:
;src/utils/end_game.c:38: draw_text(6, 2, "HOPPY RUN");
	ld	de, #___str_2
	push	de
	ld	e, #0x02
	ld	a, #0x06
	call	_draw_text
;src/utils/end_game.c:39: }
	ret
___str_0:
	.ascii "HOPPY SNAKE"
	.db 0x00
___str_1:
	.ascii "HOPPY BIRD"
	.db 0x00
___str_2:
	.ascii "HOPPY RUN"
	.db 0x00
;src/utils/end_game.c:41: static void draw_current_score(uint8_t *scores, uint8_t selected)
;	---------------------------------
; Function draw_current_score
; ---------------------------------
_draw_current_score:
	add	sp, #-8
	ldhl	sp,	#5
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
	ld	(hl), a
;src/utils/end_game.c:45: for (uint8_t i = 0; i < MAX_SCORES; i++) {
	ldhl	sp,	#7
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x05
	jr	NC, 00105$
;src/utils/end_game.c:46: str[0] = '0' + (scores[i] / 100);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	push	bc
	ld	e, #0x64
	call	__divuchar
	ld	a, c
	pop	bc
	add	a, #0x30
	ldhl	sp,	#0
	ld	(hl), a
;src/utils/end_game.c:47: str[1] = '0' + (scores[i] / 10 % 10);
	ld	a, (bc)
	push	bc
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	pop	bc
	add	a, #0x30
	ldhl	sp,	#1
	ld	(hl), a
;src/utils/end_game.c:48: str[2] = '0' + (scores[i] % 10);
	ld	a, (bc)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	add	a, #0x30
	ldhl	sp,	#2
;src/utils/end_game.c:49: str[3] = '\0';
	ld	(hl+), a
;src/utils/end_game.c:50: draw_text(6, 7 + i * 2, (i == selected) ? ">" : " ");
	xor	a, a
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NZ, 00107$
	ld	bc, #___str_3
	jr	00108$
00107$:
	ld	bc, #___str_4
00108$:
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, a
	add	a, #0x07
	ld	e, a
	push	de
	push	bc
	ld	a, #0x06
	call	_draw_text
	pop	de
;src/utils/end_game.c:51: draw_text(8, 7 + i * 2, str);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	a, #0x08
	call	_draw_text
;src/utils/end_game.c:45: for (uint8_t i = 0; i < MAX_SCORES; i++) {
	ldhl	sp,	#7
	inc	(hl)
	jr	00103$
00105$:
;src/utils/end_game.c:53: }
	add	sp, #8
	ret
___str_3:
	.ascii ">"
	.db 0x00
___str_4:
	.ascii " "
	.db 0x00
;src/utils/end_game.c:55: static bool draw_leaderboard(uint8_t id, uint8_t score)
;	---------------------------------
; Function draw_leaderboard
; ---------------------------------
_draw_leaderboard:
	add	sp, #-7
	ld	c, a
	ldhl	sp,	#6
;src/utils/end_game.c:58: uint8_t selected = MAX_SCORES;
	ld	a, e
	ld	(hl-), a
	ld	(hl), #0x05
;src/utils/end_game.c:60: init_bkg(0);
	xor	a, a
	push	af
	inc	sp
	call	_init_bkg
	inc	sp
;src/utils/end_game.c:61: load_scores(id, scores);
	push	bc
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	ld	a, c
	call	_load_scores
	pop	bc
;src/utils/end_game.c:62: print_game_score(id);
	ld	a, c
	call	_print_game_score
;src/utils/end_game.c:63: draw_text(5, 4, "BEST SCORES");
	ld	de, #___str_5
	push	de
	ld	e, #0x04
	ld	a, #0x05
	call	_draw_text
;src/utils/end_game.c:64: for (int8_t i = MAX_SCORES - 1; i >= 0; i--) {
	ld	bc, #0x404
00105$:
	bit	7, b
	jr	NZ, 00103$
;src/utils/end_game.c:65: if (scores[i] == score) {
	ld	e, b
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, (hl)
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, e
	jr	NZ, 00106$
;src/utils/end_game.c:66: selected = i;
	ldhl	sp,	#5
	ld	(hl), c
;src/utils/end_game.c:67: break;
	jr	00103$
00106$:
;src/utils/end_game.c:64: for (int8_t i = MAX_SCORES - 1; i >= 0; i--) {
	dec	b
	ld	c, b
	jr	00105$
00103$:
;src/utils/end_game.c:70: draw_current_score(scores, selected);
	ldhl	sp,	#5
	ld	a, (hl)
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_draw_current_score
;src/utils/end_game.c:71: return handle_keys_menu();
	call	_handle_keys_menu
;src/utils/end_game.c:72: }
	add	sp, #7
	ret
___str_5:
	.ascii "BEST SCORES"
	.db 0x00
;src/utils/end_game.c:74: bool game_over_screen(uint8_t id, uint8_t score)
;	---------------------------------
; Function game_over_screen
; ---------------------------------
_game_over_screen::
	ld	c, a
	ld	b, e
;src/utils/end_game.c:78: save_score(id, score);
	push	bc
	ld	e, b
	ld	a, c
	call	_save_score
	pop	bc
;src/utils/end_game.c:79: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;src/utils/end_game.c:80: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/utils/end_game.c:81: menu_font_load();
	push	bc
	call	_menu_font_load
	pop	bc
;src/utils/end_game.c:82: init_bkg(0);
	xor	a, a
	push	af
	inc	sp
	call	_init_bkg
	inc	sp
;src/utils/end_game.c:83: draw_text(5, 7, "GAME OVER");
	push	bc
	ld	de, #___str_6
	push	de
	ld	e, #0x07
	ld	a, #0x05
	call	_draw_text
;src/utils/end_game.c:84: draw_text(4, 9, "PRESS START");
	ld	de, #___str_7
	push	de
	ld	e, #0x09
	ld	a, #0x04
	call	_draw_text
	pop	bc
;src/utils/end_game.c:85: while (1) {
00106$:
;src/utils/end_game.c:86: vsync();
	call	_vsync
;src/utils/end_game.c:87: keys = joypad();
	call	_joypad
;src/utils/end_game.c:88: if (keys & J_START)
	bit	7, a
	jr	Z, 00102$
;src/utils/end_game.c:89: return true;
	ld	a, #0x01
	ret
00102$:
;src/utils/end_game.c:90: if (keys & J_SELECT)
	bit	6, a
	jr	Z, 00106$
;src/utils/end_game.c:91: return draw_leaderboard(id, score);
	ld	e, b
	ld	a, c
;src/utils/end_game.c:93: }
	jp	_draw_leaderboard
___str_6:
	.ascii "GAME OVER"
	.db 0x00
___str_7:
	.ascii "PRESS START"
	.db 0x00
;src/utils/end_game.c:95: static void show_menu(uint8_t selected)
;	---------------------------------
; Function show_menu
; ---------------------------------
_show_menu:
	ld	c, a
;src/utils/end_game.c:97: menu_font_load();
	push	bc
	call	_menu_font_load
	pop	bc
;src/utils/end_game.c:98: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/utils/end_game.c:99: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;src/utils/end_game.c:100: draw_menu(selected);
	ld	a, c
;src/utils/end_game.c:101: }
	jp	_draw_menu
;src/utils/end_game.c:103: void run_hoppy_game(void)
;	---------------------------------
; Function run_hoppy_game
; ---------------------------------
_run_hoppy_game::
	add	sp, #-4
;src/utils/end_game.c:105: uint8_t selected = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
;src/utils/end_game.c:106: uint8_t prev_keys = 0xFF;
	ldhl	sp,	#3
	ld	(hl), #0xff
;src/utils/end_game.c:109: init_menu(selected);
	xor	a, a
	call	_init_menu
;src/utils/end_game.c:110: while (1) {
00104$:
;src/utils/end_game.c:111: vsync();
	call	_vsync
;src/utils/end_game.c:112: keys = joypad();
	call	_joypad
	ldhl	sp,	#1
	ld	(hl), a
;src/utils/end_game.c:113: handle_menu_input(&selected, keys, prev_keys);
	ldhl	sp,	#0
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	call	_handle_menu_input
;src/utils/end_game.c:114: if ((keys & ~prev_keys) & J_A) {
	ldhl	sp,	#3
	ld	a, (hl-)
	dec	hl
	ld	b, #0x00
	cpl
	ld	c, a
	ld	a, b
	cpl
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl)
	and	a, c
	bit	4, a
	jr	Z, 00102$
;src/utils/end_game.c:115: launch_selected_game(selected);
	ldhl	sp,	#0
	ld	a, (hl)
	call	_launch_selected_game
;src/utils/end_game.c:116: show_menu(selected);
	ldhl	sp,	#0
	ld	a, (hl)
	call	_show_menu
00102$:
;src/utils/end_game.c:118: prev_keys = keys;
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	ld	(hl), a
	jr	00104$
;src/utils/end_game.c:120: }
	add	sp, #4
	ret
;src/utils/end_game.c:122: void checkerboard_wipe_transition(void)
;	---------------------------------
; Function checkerboard_wipe_transition
; ---------------------------------
_checkerboard_wipe_transition::
	dec	sp
;src/utils/end_game.c:124: uint8_t checker_tile = 3;
	ldhl	sp,	#0
	ld	(hl), #0x03
;src/utils/end_game.c:126: set_bkg_data(3, 1, CheckerBoardTiles);
	ld	de, #_CheckerBoardTiles
	push	de
	ld	hl, #0x103
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/utils/end_game.c:127: for (uint8_t x = 0; x < 20; x++) {
	ld	b, #0x00
00107$:
	ld	a, b
	sub	a, #0x14
	jr	NC, 00109$
;src/utils/end_game.c:128: for (uint8_t y = 0; y < 20; y++)
	ld	c, #0x00
00104$:
	ld	a, c
	sub	a, #0x14
	jr	NC, 00101$
;src/utils/end_game.c:129: set_bkg_tiles(x, y, 1, 1, &checker_tile);
	ldhl	sp,	#0
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
;src/utils/end_game.c:128: for (uint8_t y = 0; y < 20; y++)
	inc	c
	jr	00104$
00101$:
;src/utils/end_game.c:130: vsync();
	call	_vsync
;src/utils/end_game.c:127: for (uint8_t x = 0; x < 20; x++) {
	inc	b
	jr	00107$
00109$:
;src/utils/end_game.c:132: }
	inc	sp
	ret
;src/utils/end_game.c:134: void clear_all_sprites(void)
;	---------------------------------
; Function clear_all_sprites
; ---------------------------------
_clear_all_sprites::
;src/utils/end_game.c:136: for (uint8_t i = 0; i < 40; i++) {
	ld	c, #0x00
00105$:
	ld	a, c
	sub	a, #0x28
	jr	NC, 00101$
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x90
	ld	(hl+), a
	ld	(hl), #0x00
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl,#_shadow_OAM + 1
	add	hl,de
	inc	hl
	ld	(hl), #0x00
;src/utils/end_game.c:136: for (uint8_t i = 0; i < 40; i++) {
	inc	c
	jr	00105$
00101$:
;src/utils/end_game.c:140: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/utils/end_game.c:141: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
