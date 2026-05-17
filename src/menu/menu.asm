;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module menu
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _flappy_update
	.globl _flappy_init
	.globl _flappy_get_state
	.globl _game_over_screen
	.globl _clear_all_sprites
	.globl _checkerboard_wipe_transition
	.globl _run_hoppy
	.globl _set_bkg_tiles
	.globl _display_off
	.globl _vsync
	.globl _draw_text
	.globl _snake_game_loop
	.globl _draw_menu
	.globl _handle_menu_input
	.globl _launch_selected_game
	.globl _run_flappy
	.globl _run_snake
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
;src/menu/menu.c:16: void draw_menu(uint8_t selected)
;	---------------------------------
; Function draw_menu
; ---------------------------------
_draw_menu::
	add	sp, #-8
	ld	c, a
;src/menu/menu.c:18: const char *menu_labels[] = {
	ldhl	sp,	#0
	ld	a, #<(___str_0)
	ld	(hl+), a
	ld	a, #>(___str_0)
	ld	(hl+), a
	ld	a, #<(___str_1)
	ld	(hl+), a
	ld	a, #>(___str_1)
	ld	(hl+), a
	ld	a, #<(___str_2)
	ld	(hl+), a
;src/menu/menu.c:21: uint8_t empty = 0;
	ld	a, #>(___str_2)
	ld	(hl+), a
;src/menu/menu.c:23: for (uint8_t y = 0; y < 18; y++)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
00111$:
	ldhl	sp,	#7
	ld	a, (hl)
	sub	a, #0x12
	jr	NC, 00102$
;src/menu/menu.c:24: for (uint8_t x = 0; x < 20; x++)
	ld	e, #0x00
00108$:
	ld	a, e
	sub	a, #0x14
	jr	NC, 00112$
;src/menu/menu.c:25: set_bkg_tiles(x, y, 1, 1, &empty);
	push	de
	ld	hl, #8
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#13
	ld	d, (hl)
	push	de
	call	_set_bkg_tiles
	add	sp, #6
	pop	de
;src/menu/menu.c:24: for (uint8_t x = 0; x < 20; x++)
	inc	e
	jr	00108$
00112$:
;src/menu/menu.c:23: for (uint8_t y = 0; y < 18; y++)
	ldhl	sp,	#7
	inc	(hl)
	jr	00111$
00102$:
;src/menu/menu.c:26: draw_text(5, 5, "SELECT GAME");
	push	bc
	ld	de, #___str_3
	push	de
	ld	a,#0x05
	ld	e,a
	call	_draw_text
	pop	bc
;src/menu/menu.c:27: for (uint8_t i = 0; i < MENU_ITEMS; i++) {
	ld	b, #0x00
00114$:
	ld	a, b
	sub	a, #0x03
	jr	NC, 00116$
;src/menu/menu.c:29: draw_text(3, 8 + i * 2, ">");
	ld	a, b
	add	a, a
	add	a, #0x08
	ldhl	sp,	#7
	ld	(hl), a
;src/menu/menu.c:28: if (i == selected)
	ld	a, c
	sub	a, b
	jr	NZ, 00104$
;src/menu/menu.c:29: draw_text(3, 8 + i * 2, ">");
	push	bc
	ld	de, #___str_4
	push	de
	ld	e, (hl)
	ld	a, #0x03
	call	_draw_text
	pop	bc
	jr	00105$
00104$:
;src/menu/menu.c:31: draw_text(3, 8 + i * 2, " ");
	push	bc
	ld	de, #___str_5
	push	de
	ldhl	sp,	#11
	ld	e, (hl)
	ld	a, #0x03
	call	_draw_text
	pop	bc
00105$:
;src/menu/menu.c:32: draw_text(5, 8 + i * 2, menu_labels[i]);
	ld	l, b
	ld	h, #0x00
	add	hl, hl
	ld	e, l
	ld	d, h
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	push	bc
	push	hl
	ldhl	sp,	#11
	ld	e, (hl)
	ld	a, #0x05
	call	_draw_text
	pop	bc
;src/menu/menu.c:27: for (uint8_t i = 0; i < MENU_ITEMS; i++) {
	inc	b
	jr	00114$
00116$:
;src/menu/menu.c:34: }
	add	sp, #8
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
___str_3:
	.ascii "SELECT GAME"
	.db 0x00
___str_4:
	.ascii ">"
	.db 0x00
___str_5:
	.ascii " "
	.db 0x00
;src/menu/menu.c:36: void handle_menu_input(uint8_t *selected, uint8_t keys, uint8_t prev_keys)
;	---------------------------------
; Function handle_menu_input
; ---------------------------------
_handle_menu_input::
	ld	c, a
;src/menu/menu.c:38: uint8_t pressed = keys & ~prev_keys;
	ldhl	sp,	#2
	ld	a, (hl)
	cpl
	and	a, c
	ld	h, a
;src/menu/menu.c:40: if (pressed & J_DOWN) {
	bit	3, h
	jr	Z, 00102$
;src/menu/menu.c:41: *selected = (*selected + 1) % MENU_ITEMS;
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	inc	bc
	ld	l, c
	ld	a, b
	push	hl
	push	de
	ld	bc, #0x0003
	ld	e, l
	ld	d, a
	call	__modsint
	pop	de
	pop	hl
	ld	a, c
	ld	(de), a
;src/menu/menu.c:42: draw_menu(*selected);
	push	hl
	push	de
	call	_draw_menu
	pop	de
	pop	hl
00102$:
;src/menu/menu.c:44: if (pressed & J_UP) {
	bit	2, h
	jr	Z, 00105$
;src/menu/menu.c:45: *selected = (*selected + MENU_ITEMS - 1) % MENU_ITEMS;
	ld	a, (de)
	ld	h, #0x00
	ld	l, a
	inc	hl
	inc	hl
	push	de
	ld	bc, #0x0003
	ld	e, l
	ld	d, h
	call	__modsint
	pop	de
	ld	a, c
	ld	(de), a
;src/menu/menu.c:46: draw_menu(*selected);
	call	_draw_menu
00105$:
;src/menu/menu.c:48: }
	pop	hl
	inc	sp
	jp	(hl)
;src/menu/menu.c:50: void launch_selected_game(uint8_t selected)
;	---------------------------------
; Function launch_selected_game
; ---------------------------------
_launch_selected_game::
	add	sp, #-25
	ldhl	sp,	#20
	ld	(hl), a
;src/menu/menu.c:52: menu_t game_labels[] = {
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	ld	a, #<(_run_snake)
	ld	(hl+), a
	ld	a, #>(_run_snake)
	ld	(hl+), a
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, #<(_run_flappy)
	ld	(hl+), a
	ld	a, #>(_run_flappy)
	ld	(hl+), a
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, #<(_run_hoppy)
	ld	(hl+), a
	ld	a, #>(_run_hoppy)
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/menu/menu.c:57: clear_all_sprites();
	call	_clear_all_sprites
;src/menu/menu.c:58: for (uint32_t i = 0; game_labels[i].func != NULL; i++) {
	xor	a, a
	ldhl	sp,	#21
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
00105$:
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sla	c
	rl	b
	sla	c
	rl	b
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#20
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#19
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	inc	hl
	ld	a,	(hl-)
	ld	l, (hl)
	or	a, l
	jr	Z, 00107$
;src/menu/menu.c:59: if ((int)selected == game_labels[i].id) {
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#16
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#16
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00106$
	inc	hl
	xor	a, a
	sub	a, (hl)
	jr	NZ, 00106$
;src/menu/menu.c:60: checkerboard_wipe_transition();
	push	bc
	call	_checkerboard_wipe_transition
;src/menu/menu.c:61: clear_all_sprites();
	call	_clear_all_sprites
;src/menu/menu.c:62: game_labels[i].func();
	pop	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
;src/menu/menu.c:63: break;
	jr	00107$
00106$:
;src/menu/menu.c:58: for (uint32_t i = 0; game_labels[i].func != NULL; i++) {
	ldhl	sp,	#21
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
	jr	00105$
00107$:
;src/menu/menu.c:66: }
	add	sp, #25
	ret
;src/menu/menu.c:68: static bool flappy_play_round(void)
;	---------------------------------
; Function flappy_play_round
; ---------------------------------
_flappy_play_round:
	dec	sp
;src/menu/menu.c:70: uint8_t saved_lcdc = LCDC_REG;
	ldh	a, (_LCDC_REG + 0)
	ldhl	sp,	#0
	ld	(hl), a
;src/menu/menu.c:73: flappy_init();
	call	_flappy_init
;src/menu/menu.c:74: while (1) {
00104$:
;src/menu/menu.c:75: vsync();
	call	_vsync
;src/menu/menu.c:76: if (flappy_update())
	call	_flappy_update
	or	a, a
	jr	Z, 00104$
;src/menu/menu.c:79: DISPLAY_OFF;
	call	_display_off
;src/menu/menu.c:80: LCDC_REG = saved_lcdc;
	ldhl	sp,	#0
	ld	a, (hl)
	ldh	(_LCDC_REG + 0), a
;src/menu/menu.c:81: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/menu/menu.c:82: result = game_over_screen(GAME_FLAPPY, flappy_get_state()->score);
	call	_flappy_get_state
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	e, a
	ld	a, #0x01
	inc	sp
	jp	_game_over_screen
;src/menu/menu.c:83: return result;
;src/menu/menu.c:84: }
	inc	sp
	ret
;src/menu/menu.c:86: void run_flappy(void)
;	---------------------------------
; Function run_flappy
; ---------------------------------
_run_flappy::
;src/menu/menu.c:88: while (flappy_play_round());
00101$:
	call	_flappy_play_round
	bit	0,a
	jr	NZ, 00101$
;src/menu/menu.c:89: }
	ret
;src/menu/menu.c:91: void run_snake(void)
;	---------------------------------
; Function run_snake
; ---------------------------------
_run_snake::
;src/menu/menu.c:95: while (1) {
00104$:
;src/menu/menu.c:96: score = snake_game_loop();
	call	_snake_game_loop
;src/menu/menu.c:97: if (!game_over_screen(GAME_SNAKE, score))
	ld	e, a
	xor	a, a
	call	_game_over_screen
	bit	0,a
	jr	NZ, 00104$
;src/menu/menu.c:98: return;
;src/menu/menu.c:100: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
