;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module snake_game_loop
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _snake_game_loop
	.globl _increment_score
	.globl _snake_key_handler
	.globl _snake_step
	.globl _init_snake_game
	.globl _place_fish
	.globl _vsync
	.globl _joypad
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
;src/games/hoppy_snake/snake_game_loop.c:19: static uint8_t delay_and_get_event(size_t delay_size)
;	---------------------------------
; Function delay_and_get_event
; ---------------------------------
_delay_and_get_event:
	ld	c, e
	ld	b, d
;src/games/hoppy_snake/snake_game_loop.c:22: uint8_t last_key_pressed = 0x00u;
	ld	l, #0x00
;src/games/hoppy_snake/snake_game_loop.c:29: return last_key_pressed;
00105$:
;src/games/hoppy_snake/snake_game_loop.c:24: for (; delay_size > 0; --delay_size) {
	ld	a, b
	or	a, c
	jr	Z, 00103$
;src/games/hoppy_snake/snake_game_loop.c:25: event = joypad();
	call	_joypad
;src/games/hoppy_snake/snake_game_loop.c:26: if (event & SNAKE_KEYMASK)
	ld	e, a
	and	a, #0x0f
	jr	Z, 00106$
;src/games/hoppy_snake/snake_game_loop.c:27: last_key_pressed = event;
	ld	l, e
00106$:
;src/games/hoppy_snake/snake_game_loop.c:24: for (; delay_size > 0; --delay_size) {
	dec	bc
	jr	00105$
00103$:
;src/games/hoppy_snake/snake_game_loop.c:29: return last_key_pressed;
	ld	a, l
;src/games/hoppy_snake/snake_game_loop.c:30: }
	ret
;src/games/hoppy_snake/snake_game_loop.c:32: uint8_t snake_game_loop(void)
;	---------------------------------
; Function snake_game_loop
; ---------------------------------
_snake_game_loop::
	ld	hl, #-354
	add	hl, sp
	ld	sp, hl
;src/games/hoppy_snake/snake_game_loop.c:35: snake_game_key_t game_event = NO_EVENT;
	ld	hl, #351
	add	hl, sp
	ld	(hl), #0x00
;src/games/hoppy_snake/snake_game_loop.c:38: init_snake_game(&snake_game);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	a, l
	ld	hl, #354
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #353
	add	hl, sp
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_init_snake_game
;src/games/hoppy_snake/snake_game_loop.c:39: while (game_event != GAME_OVER) {
00106$:
	ld	hl, #351
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00108$
;src/games/hoppy_snake/snake_game_loop.c:40: if (game_event == FISH_EATEN && place_fish(&snake_game) == FAILURE)
	ld	hl, #351
	add	hl, sp
	ld	a, (hl)
	dec	a
	ld	a, #0x01
	jr	Z, 00148$
	xor	a, a
00148$:
	ld	e, a
	or	a, a
	jr	Z, 00102$
	push	de
	ld	hl, #354
	add	hl, sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_place_fish
	pop	de
	ld	a, c
	and	a, b
;src/games/hoppy_snake/snake_game_loop.c:41: return SUCCESS;
	inc	a
	jr	Z, 00109$
00102$:
;src/games/hoppy_snake/snake_game_loop.c:42: if (game_event == FISH_EATEN)
	ld	a, e
	or	a, a
	jr	Z, 00105$
;src/games/hoppy_snake/snake_game_loop.c:43: increment_score(&(snake_game.score));
	ld	hl, #350
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_increment_score
00105$:
;src/games/hoppy_snake/snake_game_loop.c:44: event = delay_and_get_event(SNAKE_FRAME_LENGTH);
	ld	de, #0x0640
	call	_delay_and_get_event
	ld	c, a
;src/games/hoppy_snake/snake_game_loop.c:45: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_snake/snake_game_loop.c:46: vsync();
	call	_vsync
;src/games/hoppy_snake/snake_game_loop.c:38: init_snake_game(&snake_game);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	a, l
	ld	hl, #354
	add	hl, sp
	ld	(hl), a
	pop	hl
	ld	a, h
	ld	hl, #353
	add	hl, sp
;src/games/hoppy_snake/snake_game_loop.c:47: snake_key_handler(&snake_game, event);
	ld	(hl-), a
	ld	a, c
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_snake_key_handler
;src/games/hoppy_snake/snake_game_loop.c:48: game_event = snake_step(&snake_game);
	ld	hl, #352
	add	hl, sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_snake_step
	ld	hl, #351
	add	hl, sp
	ld	(hl), a
	jr	00106$
00108$:
;src/games/hoppy_snake/snake_game_loop.c:50: return snake_game.score;
	ld	hl, #350
	add	hl, sp
	ld	a, (hl)
00109$:
;src/games/hoppy_snake/snake_game_loop.c:51: }
	ld	hl, #354
	add	hl, sp
	ld	sp, hl
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
