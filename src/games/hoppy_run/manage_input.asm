;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module manage_input
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _draw_pipe_at
	.globl _joypad
	.globl _handle_input
	.globl _handle_jump
	.globl _handle_run
	.globl _update_pipe
	.globl _handle_collisions
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
;src/games/hoppy_run/manage_input.c:13: void handle_input(input_t *input)
;	---------------------------------
; Function handle_input
; ---------------------------------
_handle_input::
	ld	c, e
	ld	b, d
;src/games/hoppy_run/manage_input.c:15: input->keys = joypad();
	ld	l, c
	ld	h, b
	call	_joypad
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:16: if ((input->keys & J_A || input->keys & J_UP) && !input->is_jumping) {
	bit	4, a
	jr	NZ, 00104$
	bit	2, (hl)
	ret	Z
00104$:
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	bit	0, (hl)
	ret	NZ
;src/games/hoppy_run/manage_input.c:17: input->is_jumping = true;
	ld	(hl), #0x01
;src/games/hoppy_run/manage_input.c:18: input->jump_level -= JUMP_FORCE;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	add	a, #0xf7
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:19: input->hover_timer = HOVER_FRAMES;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x08
;src/games/hoppy_run/manage_input.c:21: }
	ret
;src/games/hoppy_run/manage_input.c:23: void handle_jump(input_t *input)
;	---------------------------------
; Function handle_jump
; ---------------------------------
_handle_jump::
	add	sp, #-6
	ldhl	sp,	#4
	ld	a, e
	ld	(hl+), a
;src/games/hoppy_run/manage_input.c:25: input->jump_level += GRAVITY;
	ld	a, d
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, e
	ld	h, d
	inc	hl
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	c, a
	inc	c
	pop	hl
	push	hl
	ld	(hl), c
;src/games/hoppy_run/manage_input.c:26: if (input->jump_level >= 0 && input->hover_timer > 0) {
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	bit	7, c
	jr	NZ, 00102$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	or	a, a
	jr	Z, 00102$
;src/games/hoppy_run/manage_input.c:27: input->hover_timer--;
	dec	hl
	dec	a
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:28: input->jump_level = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
00102$:
;src/games/hoppy_run/manage_input.c:30: input->cat_y += input->jump_level;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	pop	de
	push	de
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	add	a, l
;src/games/hoppy_run/manage_input.c:31: if (input->cat_y >= GROUND_Y) {
	ld	(bc), a
	xor	a, #0x80
	sub	a, #0xf4
	jr	C, 00105$
;src/games/hoppy_run/manage_input.c:32: input->cat_y = GROUND_Y;
	ld	a, #0x74
	ld	(bc), a
;src/games/hoppy_run/manage_input.c:33: input->is_jumping = false;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;src/games/hoppy_run/manage_input.c:34: input->jump_level = 0;
	pop	hl
	ld	(hl), #0x00
	push	hl
;src/games/hoppy_run/manage_input.c:35: input->hover_timer = 0;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00105$:
;src/games/hoppy_run/manage_input.c:37: move_sprite(0, CAT_X, (uint8_t)input->cat_y);
	ld	a, (bc)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #_shadow_OAM
	ld	(hl+), a
	ld	(hl), #0x28
;src/games/hoppy_run/manage_input.c:38: move_sprite(1, CAT_X + 8, (uint8_t)input->cat_y);
	ld	a, (bc)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), #0x30
;src/games/hoppy_run/manage_input.c:38: move_sprite(1, CAT_X + 8, (uint8_t)input->cat_y);
;src/games/hoppy_run/manage_input.c:39: }
	add	sp, #6
	ret
;src/games/hoppy_run/manage_input.c:41: void handle_run(display_t *display)
;	---------------------------------
; Function handle_run
; ---------------------------------
_handle_run::
	dec	sp
;src/games/hoppy_run/manage_input.c:43: display->counter++;
	ld	l, e
	ld	h, d
	inc	hl
	inc	(hl)
	ld	a, (hl)
;src/games/hoppy_run/manage_input.c:44: if (display->counter >= ANIM_SPEED) {
	sub	a, #0x08
	jr	C, 00105$
;src/games/hoppy_run/manage_input.c:45: display->counter = 0;
	ld	(hl), #0x00
;src/games/hoppy_run/manage_input.c:46: display->frame = (display->frame + 1) % 3;
	ld	a, (de)
	ld	l, a
	ld	h, #0x00
	inc	hl
	push	de
	ld	bc, #0x0003
	ld	e, l
	ld	d, h
	call	__modsint
	pop	de
	ld	a, c
	ld	(de), a
;src/games/hoppy_run/manage_input.c:47: set_sprite_tile(0, display->frame * 4);
	add	a, a
	add	a, a
	ldhl	sp,	#0
	ld	(hl), a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	bc, #_shadow_OAM+2
	ld	a, (hl)
	ld	(bc), a
;src/games/hoppy_run/manage_input.c:48: set_sprite_tile(1, display->frame * 4 + 2);
	ld	a, (de)
	add	a, a
	add	a, a
	add	a, #0x02
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), c
;src/games/hoppy_run/manage_input.c:48: set_sprite_tile(1, display->frame * 4 + 2);
00105$:
;src/games/hoppy_run/manage_input.c:50: }
	inc	sp
	ret
;src/games/hoppy_run/manage_input.c:52: void update_pipe(pipe_t *pipe, display_t *display)
;	---------------------------------
; Function update_pipe
; ---------------------------------
_update_pipe::
	add	sp, #-12
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_run/manage_input.c:56: if (!pipe->active) {
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
;src/games/hoppy_run/manage_input.c:57: pipe->world_x = display->scroll + PIPE_SPAWN_X;
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	push	de
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:58: pipe->col = (pipe->world_x >> 3) & 0x1F;
	push	de
	ld	hl, #0x0003
	add	hl, de
	pop	de
	inc	sp
	inc	sp
	push	hl
;src/games/hoppy_run/manage_input.c:59: pipe->height = PIPE_HEIGHT_MIN +
	inc	de
	inc	de
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
;src/games/hoppy_run/manage_input.c:56: if (!pipe->active) {
	ld	a, d
	ld	(hl+), a
	inc	hl
	bit	0, (hl)
	jr	NZ, 00102$
;src/games/hoppy_run/manage_input.c:57: pipe->world_x = display->scroll + PIPE_SPAWN_X;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	d, a
	ld	a, l
	add	a, #0x9a
	ld	e, a
	ld	a, d
	adc	a, #0x00
	ldhl	sp,	#4
	ld	(hl), e
	inc	hl
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
;src/games/hoppy_run/manage_input.c:58: pipe->col = (pipe->world_x >> 3) & 0x1F;
	ld	a, (hl-)
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	srl	d
	rr	e
	srl	d
	rr	e
	srl	d
	rr	e
	ld	a, e
	and	a, #0x1f
	pop	hl
	push	hl
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:60: (rand() % (PIPE_HEIGHT_MAX - PIPE_HEIGHT_MIN + 1));
	call	_rand
	ld	a, e
	push	bc
	ld	e, #0x01
	call	__modschar
	ld	a, c
	pop	bc
	add	a, #0x02
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:61: pipe->active = true;
	ld	a, #0x01
	ld	(bc), a
00102$:
;src/games/hoppy_run/manage_input.c:63: screen_x = (int16_t)pipe->world_x - (int16_t)display->scroll;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
;src/games/hoppy_run/manage_input.c:65: draw_pipe_at(pipe->col, pipe->height, true);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl-), a
	pop	de
	push	de
	ld	a, (de)
;src/games/hoppy_run/manage_input.c:64: if (screen_x < -8) {
	ld	(hl+), a
	inc	hl
	ld	a, (hl+)
	sub	a, #0xf8
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00121$
	bit	7, d
	jr	NZ, 00122$
	cp	a, a
	jr	00122$
00121$:
	bit	7, d
	jr	Z, 00122$
	scf
00122$:
	jr	NC, 00104$
;src/games/hoppy_run/manage_input.c:65: draw_pipe_at(pipe->col, pipe->height, true);
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#10
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_draw_pipe_at
	pop	bc
;src/games/hoppy_run/manage_input.c:66: pipe->active = false;
	xor	a, a
	ld	(bc), a
;src/games/hoppy_run/manage_input.c:67: return;
	jr	00105$
00104$:
;src/games/hoppy_run/manage_input.c:69: draw_pipe_at(pipe->col, pipe->height, false);
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,	#8
	ld	a, (hl-)
	ld	e, a
	ld	a, (hl)
	call	_draw_pipe_at
00105$:
;src/games/hoppy_run/manage_input.c:70: }
	add	sp, #12
	ret
;src/games/hoppy_run/manage_input.c:72: bool handle_collisions(pipe_t *pipe, input_t *input, display_t *display)
;	---------------------------------
; Function handle_collisions
; ---------------------------------
_handle_collisions::
	add	sp, #-10
	ldhl	sp,	#8
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
;src/games/hoppy_run/manage_input.c:82: if (!pipe->active)
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl), a
	bit	0, (hl)
	jr	NZ, 00102$
;src/games/hoppy_run/manage_input.c:83: return false;
	xor	a, a
	jp	00108$
00102$:
;src/games/hoppy_run/manage_input.c:84: screen_x = (int16_t)pipe->world_x - (int16_t)display->scroll;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, (hl)
	ld	l, a
	ld	h, e
	inc	hl
	inc	hl
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	sub	a, l
	ld	e, a
	ld	a, b
	sbc	a, h
	ld	d, a
;src/games/hoppy_run/manage_input.c:85: pipe_left = screen_x + 1;
	ld	c, e
	ld	b, d
	inc	bc
;src/games/hoppy_run/manage_input.c:86: pipe_right = screen_x + 7;
	ld	hl, #0x0007
	add	hl, de
;src/games/hoppy_run/manage_input.c:87: if (pipe_right > cat_left && pipe_left < cat_right) {
	ld	e, h
	ld	d, #0x00
	ld	a, #0x2c
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00138$
	bit	7, d
	jr	NZ, 00139$
	cp	a, a
	jr	00139$
00138$:
	bit	7, d
	jr	Z, 00139$
	scf
00139$:
	jp	NC, 00106$
	ld	a, c
	sub	a, #0x34
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00106$
;src/games/hoppy_run/manage_input.c:88: pipe_top_y = ((int16_t)(PIPE_BASE_ROW - pipe->height + 1) * 8) + 16;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	de, #0x000e
	ld	(hl), d
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ld	a, #0x03
00140$:
	ldhl	sp,	#2
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00140$
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#5
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:89: cat_bottom = (int16_t)input->cat_y + 14;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0003
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x000e
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl), a
;src/games/hoppy_run/manage_input.c:90: if (cat_bottom > pipe_top_y)
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z, 00141$
	bit	7, d
	jr	NZ, 00142$
	cp	a, a
	jr	00142$
00141$:
	bit	7, d
	jr	Z, 00142$
	scf
00142$:
	jr	NC, 00106$
;src/games/hoppy_run/manage_input.c:91: return true;
	ld	a, #0x01
	jr	00108$
00106$:
;src/games/hoppy_run/manage_input.c:93: return false;
	xor	a, a
00108$:
;src/games/hoppy_run/manage_input.c:94: }
	add	sp, #10
	pop	hl
	pop	bc
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
