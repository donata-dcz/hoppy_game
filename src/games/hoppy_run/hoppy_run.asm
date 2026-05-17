;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module hoppy_run
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _handle_collision_damage
	.globl _check_game_over
	.globl _handle_sprite_animation
	.globl _game_over_screen
	.globl _clear_all_sprites
	.globl _handle_collisions
	.globl _update_pipe
	.globl _handle_run
	.globl _handle_jump
	.globl _handle_input
	.globl _display_hoppy
	.globl _setup_score_window
	.globl _draw_hoppy_score
	.globl _display_pipe
	.globl _draw_lives
	.globl _display_background
	.globl _vsync
	.globl _manage_main_loop
	.globl _run_hoppy
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
;src/games/hoppy_run/hoppy_run.c:13: void handle_sprite_animation(display_t *display, input_t *input)
;	---------------------------------
; Function handle_sprite_animation
; ---------------------------------
_handle_sprite_animation::
;src/games/hoppy_run/hoppy_run.c:15: if (input->is_jumping) {
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	bit	0, c
	jp	Z, _handle_run
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x08
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
;src/games/hoppy_run/hoppy_run.c:17: set_sprite_tile(1, 10);
;src/games/hoppy_run/hoppy_run.c:19: handle_run(display);
;src/games/hoppy_run/hoppy_run.c:21: }
	ret
;src/games/hoppy_run/hoppy_run.c:23: bool check_game_over(display_t *display)
;	---------------------------------
; Function check_game_over
; ---------------------------------
_check_game_over::
;src/games/hoppy_run/hoppy_run.c:25: if (display->lives == 0) {
	ld	hl, #0x0004
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;src/games/hoppy_run/hoppy_run.c:26: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/hoppy_run.c:27: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/hoppy_run.c:28: return true;
	ld	a, #0x01
	ret
00102$:
;src/games/hoppy_run/hoppy_run.c:30: return false;
	xor	a, a
;src/games/hoppy_run/hoppy_run.c:31: }
	ret
;src/games/hoppy_run/hoppy_run.c:33: void handle_collision_damage(pipe_t *pipe, input_t *input,
;	---------------------------------
; Function handle_collision_damage
; ---------------------------------
_handle_collision_damage::
	push	de
;src/games/hoppy_run/hoppy_run.c:36: if (*invincible > 0) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00102$
;src/games/hoppy_run/hoppy_run.c:37: (*invincible)--;
	dec	a
	ld	(de), a
;src/games/hoppy_run/hoppy_run.c:38: return;
	jr	00105$
00102$:
;src/games/hoppy_run/hoppy_run.c:40: if (handle_collisions(pipe, input, display)) {
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	push	hl
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_handle_collisions
	ld	c, a
	pop	de
	bit	0, c
	jr	Z, 00105$
;src/games/hoppy_run/hoppy_run.c:41: display->lives--;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	dec	(hl)
;src/games/hoppy_run/hoppy_run.c:42: *invincible = 60;
	ld	a, #0x3c
	ld	(de), a
;src/games/hoppy_run/hoppy_run.c:43: draw_lives(display->lives);
	ld	a, (hl)
	call	_draw_lives
00105$:
;src/games/hoppy_run/hoppy_run.c:45: }
	inc	sp
	inc	sp
	pop	hl
	add	sp, #4
	jp	(hl)
;src/games/hoppy_run/hoppy_run.c:47: static void update_scroll(display_t *display, uint8_t *increase)
;	---------------------------------
; Function update_scroll
; ---------------------------------
_update_scroll:
	add	sp, #-11
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
;src/games/hoppy_run/hoppy_run.c:49: display->scroll++;
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_run/hoppy_run.c:50: if (display->scroll % (SPEED_INCREASE_INTERVAL * (*increase)) == 0) {
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	e, c
	ld	d, b
	ld	c, l
	ld	b, h
;src/games/hoppy_run/hoppy_run.c:51: display->speed++;
	call	__moduint
	push	bc
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
;src/games/hoppy_run/hoppy_run.c:50: if (display->scroll % (SPEED_INCREASE_INTERVAL * (*increase)) == 0) {
	ld	a, d
	or	a, e
	jr	NZ, 00111$
;src/games/hoppy_run/hoppy_run.c:51: display->speed++;
	ld	a, (bc)
	inc	a
	ld	(bc), a
;src/games/hoppy_run/hoppy_run.c:52: (*increase)++;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	inc	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/games/hoppy_run/hoppy_run.c:54: for (uint8_t i = 1; i < display->speed; i++)
00111$:
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#10
	ld	(hl), #0x01
00105$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
;src/games/hoppy_run/hoppy_run.c:49: display->scroll++;
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	c, a
	pop	de
	push	de
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;src/games/hoppy_run/hoppy_run.c:54: for (uint8_t i = 1; i < display->speed; i++)
	ldhl	sp,	#10
	ld	a, (hl)
	sub	a, c
	jr	NC, 00103$
;src/games/hoppy_run/hoppy_run.c:55: display->scroll++;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	pop	hl
	push	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_run/hoppy_run.c:54: for (uint8_t i = 1; i < display->speed; i++)
	ldhl	sp,	#10
	inc	(hl)
	jr	00105$
00103$:
;src/games/hoppy_run/hoppy_run.c:56: SCX_REG = (uint8_t)display->scroll;
	ldhl	sp,	#4
	ld	a, (hl)
	ldh	(_SCX_REG + 0), a
;src/games/hoppy_run/hoppy_run.c:57: }
	add	sp, #11
	ret
;src/games/hoppy_run/hoppy_run.c:59: static void manage_game(display_t *display, input_t *input,
;	---------------------------------
; Function manage_game
; ---------------------------------
_manage_game:
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#2
	ld	a, c
	ld	(hl+), a
;src/games/hoppy_run/hoppy_run.c:62: handle_input(input);
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_handle_input
;src/games/hoppy_run/hoppy_run.c:63: handle_sprite_animation(display, input);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_handle_sprite_animation
;src/games/hoppy_run/hoppy_run.c:64: if (input->is_jumping)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	Z, 00102$
;src/games/hoppy_run/hoppy_run.c:65: handle_jump(input);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_handle_jump
00102$:
;src/games/hoppy_run/hoppy_run.c:66: update_scroll(display, &state->increase);
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_update_scroll
;src/games/hoppy_run/hoppy_run.c:67: draw_hoppy_score(display->scroll >> 6);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	a, h
	call	_draw_hoppy_score
;src/games/hoppy_run/hoppy_run.c:68: update_pipe(&state->pipe, display);
	pop	de
	push	de
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_update_pipe
;src/games/hoppy_run/hoppy_run.c:69: handle_collision_damage(&state->pipe, input, display, &state->invincible);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0005
	add	hl, de
	pop	de
	push	hl
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_handle_collision_damage
;src/games/hoppy_run/hoppy_run.c:70: }
	add	sp, #6
	pop	hl
	pop	af
	jp	(hl)
;src/games/hoppy_run/hoppy_run.c:72: void manage_main_loop(display_t *display, input_t *input)
;	---------------------------------
; Function manage_main_loop
; ---------------------------------
_manage_main_loop::
	add	sp, #-11
	ldhl	sp,	#9
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_run/hoppy_run.c:74: loop_t state = {{0, 0, 0, false}, 0, 1};
	xor	a, a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), #0x01
;src/games/hoppy_run/hoppy_run.c:76: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/hoppy_run.c:77: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_run/hoppy_run.c:78: setup_score_window();
	call	_setup_score_window
;src/games/hoppy_run/hoppy_run.c:79: draw_hoppy_score(0);
	xor	a, a
	call	_draw_hoppy_score
;src/games/hoppy_run/hoppy_run.c:80: while (1) {
00104$:
;src/games/hoppy_run/hoppy_run.c:81: vsync();
	call	_vsync
;src/games/hoppy_run/hoppy_run.c:82: manage_game(display, input, &state);
	ld	hl, #0
	add	hl, sp
	push	hl
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_manage_game
;src/games/hoppy_run/hoppy_run.c:83: if (check_game_over(display))
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_check_game_over
	ld	c, a
	bit	0, c
	jr	Z, 00104$
;src/games/hoppy_run/hoppy_run.c:84: return;
;src/games/hoppy_run/hoppy_run.c:86: }
	add	sp, #11
	ret
;src/games/hoppy_run/hoppy_run.c:88: static display_t init_display(void)
;	---------------------------------
; Function init_display
; ---------------------------------
_init_display:
	add	sp, #-6
;src/games/hoppy_run/hoppy_run.c:92: display.scroll = 0;
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
;src/games/hoppy_run/hoppy_run.c:93: display.counter = 0;
	ld	(hl-), a
	dec	hl
;src/games/hoppy_run/hoppy_run.c:94: display.frame = 0;
	xor	a, a
	ld	(hl-), a
	ld	(hl), a
;src/games/hoppy_run/hoppy_run.c:95: display.lives = MAX_LIVES;
	ldhl	sp,	#4
;src/games/hoppy_run/hoppy_run.c:96: display.speed = 1;
	ld	a, #0x03
	ld	(hl+), a
	ld	(hl), #0x01
;src/games/hoppy_run/hoppy_run.c:97: return display;
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/games/hoppy_run/hoppy_run.c:98: }
	add	sp, #6
	pop	hl
	pop	af
	jp	(hl)
;src/games/hoppy_run/hoppy_run.c:100: static input_t init_input(void)
;	---------------------------------
; Function init_input
; ---------------------------------
_init_input:
	add	sp, #-5
;src/games/hoppy_run/hoppy_run.c:104: input.keys = 0;
	ldhl	sp,	#0
;src/games/hoppy_run/hoppy_run.c:105: input.jump_level = 0;
;src/games/hoppy_run/hoppy_run.c:106: input.is_jumping = false;
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
;src/games/hoppy_run/hoppy_run.c:107: input.cat_y = GROUND_Y;
	xor	a, a
	ld	(hl+), a
;src/games/hoppy_run/hoppy_run.c:108: input.hover_timer = 0;
	ld	a, #0x74
	ld	(hl+), a
	ld	(hl), #0x00
;src/games/hoppy_run/hoppy_run.c:109: return input;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;src/games/hoppy_run/hoppy_run.c:110: }
	add	sp, #5
	pop	hl
	pop	af
	jp	(hl)
;src/games/hoppy_run/hoppy_run.c:112: void run_hoppy(void)
;	---------------------------------
; Function run_hoppy
; ---------------------------------
_run_hoppy::
	add	sp, #-22
;src/games/hoppy_run/hoppy_run.c:118: while (1) {
00104$:
;src/games/hoppy_run/hoppy_run.c:119: clear_all_sprites();
	call	_clear_all_sprites
;src/games/hoppy_run/hoppy_run.c:120: display = init_display();
	ldhl	sp,	#11
	push	hl
	call	_init_display
	ld	de, #0x0006
	push	de
	ld	hl, #13
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/games/hoppy_run/hoppy_run.c:121: input = init_input();
	ldhl	sp,	#17
	push	hl
	call	_init_input
	ld	de, #0x0005
	push	de
	ld	hl, #19
	add	hl, sp
	ld	c, l
	ld	b, h
	ld	hl, #8
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/games/hoppy_run/hoppy_run.c:122: display_background();
	call	_display_background
;src/games/hoppy_run/hoppy_run.c:123: display_pipe();
	call	_display_pipe
;src/games/hoppy_run/hoppy_run.c:124: display_hoppy(&input, MAX_LIVES);
	ld	hl, #6
	add	hl, sp
	ld	c, l
	ld	b, h
	push	bc
	ld	a, #0x03
	ld	e, c
	ld	d, b
	call	_display_hoppy
	pop	bc
;src/games/hoppy_run/hoppy_run.c:125: manage_main_loop(&display, &input);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_manage_main_loop
;src/games/hoppy_run/hoppy_run.c:126: score = (display.scroll >> 6);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, hl
	add	hl, hl
	ld	e, h
;src/games/hoppy_run/hoppy_run.c:127: if (!game_over_screen(GAME_HOPPY, score))
	ld	a, #0x02
	call	_game_over_screen
	ld	c, a
	bit	0, c
	jr	NZ, 00104$
;src/games/hoppy_run/hoppy_run.c:128: return;
;src/games/hoppy_run/hoppy_run.c:130: }
	add	sp, #22
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
