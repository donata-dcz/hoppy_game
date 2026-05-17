;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module flappy_pipe
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _fill_bkg_rect
	.globl _init_pipes
	.globl _update_pipes
	.globl _pipe_hit_check
	.globl _pipe_score_check
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pipe_get_state_state_10000_134:
	.ds 7
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
;src/games/hoppy_bird/flappy_pipe.c:11: static pipe_state_t *pipe_get_state(void)
;	---------------------------------
; Function pipe_get_state
; ---------------------------------
_pipe_get_state:
;src/games/hoppy_bird/flappy_pipe.c:15: return &state;
	ld	bc, #_pipe_get_state_state_10000_134
;src/games/hoppy_bird/flappy_pipe.c:16: }
	ret
;src/games/hoppy_bird/flappy_pipe.c:18: static uint8_t lcg_next(pipe_state_t *s)
;	---------------------------------
; Function lcg_next
; ---------------------------------
_lcg_next:
;src/games/hoppy_bird/flappy_pipe.c:20: s->rng = s->rng * 109 + 89;
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	e, a
	add	a, a
	add	a, a
	add	a, a
	sub	a, e
	add	a, a
	add	a, a
	sub	a, e
	add	a, a
	add	a, a
	add	a, e
	add	a, #0x59
;src/games/hoppy_bird/flappy_pipe.c:21: return s->rng;
	ld	(bc), a
;src/games/hoppy_bird/flappy_pipe.c:22: }
	ret
;src/games/hoppy_bird/flappy_pipe.c:24: static void fill_sky_col(uint8_t col)
;	---------------------------------
; Function fill_sky_col
; ---------------------------------
_fill_sky_col:
	ld	b, a
;src/games/hoppy_bird/flappy_pipe.c:26: fill_bkg_rect(col, 0, 1, GROUND_ROW, T_SKY);
	ld	hl, #0x10
	push	hl
	xor	a, a
	inc	a
	push	af
	push	bc
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;src/games/hoppy_bird/flappy_pipe.c:27: }
	ret
;src/games/hoppy_bird/flappy_pipe.c:29: static void fill_pipe_col(uint8_t col)
;	---------------------------------
; Function fill_pipe_col
; ---------------------------------
_fill_pipe_col:
	ld	d, a
;src/games/hoppy_bird/flappy_pipe.c:31: pipe_state_t *s = pipe_get_state();
	push	de
	call	_pipe_get_state
	pop	de
;src/games/hoppy_bird/flappy_pipe.c:32: uint8_t bot = GROUND_ROW - s->cur_gap_y - PIPE_GAP;
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	h, a
	ld	e, h
	ld	a, #0x0a
	sub	a, e
	ld	e, a
;src/games/hoppy_bird/flappy_pipe.c:34: if (s->cur_gap_y > 0)
	ld	a, h
	or	a, a
	jr	Z, 00102$
;src/games/hoppy_bird/flappy_pipe.c:35: fill_bkg_rect(col, 0, 1, s->cur_gap_y, T_PIPE_BODY);
	push	de
	ld	a, #0x08
	push	af
	inc	sp
	push	hl
	inc	sp
	xor	a, a
	inc	a
	push	af
	push	de
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	pop	de
00102$:
;src/games/hoppy_bird/flappy_pipe.c:36: if (s->cur_gap_y > 0)
	ld	a, (bc)
	or	a, a
	jr	Z, 00104$
;src/games/hoppy_bird/flappy_pipe.c:37: fill_bkg_rect(col, s->cur_gap_y - 1, 1, 1, T_PIPE_CAP_FLIP);
	dec	a
	push	de
	ld	h, #0x04
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	pop	de
00104$:
;src/games/hoppy_bird/flappy_pipe.c:38: fill_bkg_rect(col, s->cur_gap_y, 1, PIPE_GAP, T_SKY);
	ld	a, (bc)
	push	de
	ld	h, #0x00
	push	hl
	inc	sp
	ld	h, #0x06
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	pop	de
;src/games/hoppy_bird/flappy_pipe.c:39: if (bot > 0) {
	ld	a, e
	or	a, a
	ret	Z
;src/games/hoppy_bird/flappy_pipe.c:40: fill_bkg_rect(col, s->cur_gap_y + PIPE_GAP, 1, 1, T_PIPE_CAP);
	ld	a, (bc)
	add	a, #0x06
	push	de
	ld	h, #0x03
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
	pop	de
;src/games/hoppy_bird/flappy_pipe.c:41: if (bot > 1)
	ld	a, #0x01
	sub	a, e
	ret	NC
;src/games/hoppy_bird/flappy_pipe.c:43: 1, bot - 1, T_PIPE_BODY);
	dec	e
;src/games/hoppy_bird/flappy_pipe.c:42: fill_bkg_rect(col, s->cur_gap_y + PIPE_GAP + 1,
	ld	a, (bc)
	add	a, #0x07
	ld	h, #0x08
	push	hl
	inc	sp
	ld	h, e
	push	hl
	inc	sp
	ld	h, #0x01
	push	hl
	inc	sp
	push	af
	inc	sp
	push	de
	inc	sp
	call	_fill_bkg_rect
	add	sp, #5
;src/games/hoppy_bird/flappy_pipe.c:45: }
	ret
;src/games/hoppy_bird/flappy_pipe.c:47: static void advance_column(void)
;	---------------------------------
; Function advance_column
; ---------------------------------
_advance_column:
	add	sp, #-3
;src/games/hoppy_bird/flappy_pipe.c:49: pipe_state_t *s = pipe_get_state();
	call	_pipe_get_state
;src/games/hoppy_bird/flappy_pipe.c:50: uint8_t bg_col = ((s->scroll_x >> 3) + 21) & 31;
	ld	a, (bc)
	swap	a
	rlca
	and	a, #0x1f
	add	a, #0x15
	and	a, #0x1f
	ldhl	sp,	#0
	ld	(hl), a
;src/games/hoppy_bird/flappy_pipe.c:52: if (s->pipe_phase == PIPE_SPACING) {
	ld	l, c
	ld	h, b
	inc	hl
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x16
	jr	NZ, 00102$
;src/games/hoppy_bird/flappy_pipe.c:53: s->cur_gap_y = lcg_next(s) % (PIPE_MAX_GAP_Y - PIPE_MIN_GAP_Y + 1)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	push	hl
	push	bc
	ld	e, c
	ld	d, b
	call	_lcg_next
	ld	e, #0x09
	call	__moduchar
	ld	a, c
	pop	bc
	pop	hl
	inc	a
	ld	(hl), a
;src/games/hoppy_bird/flappy_pipe.c:55: s->pipe_screen_x = 168;
	ld	hl, #0x0005
	add	hl, bc
	ld	a, #0xa8
	ld	(hl+), a
	ld	(hl), #0x00
;src/games/hoppy_bird/flappy_pipe.c:56: s->scored = 0;
	inc	bc
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
00102$:
;src/games/hoppy_bird/flappy_pipe.c:58: if (s->pipe_phase >= PIPE_SPACING)
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	sub	a, #0x16
	jr	C, 00104$
;src/games/hoppy_bird/flappy_pipe.c:59: fill_pipe_col(bg_col);
	dec	hl
	dec	hl
	ld	a, (hl)
	call	_fill_pipe_col
	jr	00105$
00104$:
;src/games/hoppy_bird/flappy_pipe.c:61: fill_sky_col(bg_col);
	ldhl	sp,	#0
	ld	a, (hl)
	call	_fill_sky_col
00105$:
;src/games/hoppy_bird/flappy_pipe.c:62: s->pipe_phase++;
	ldhl	sp,#1
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
;src/games/hoppy_bird/flappy_pipe.c:63: if (s->pipe_phase >= PIPE_WIDTH + PIPE_SPACING)
	sub	a, #0x18
	jr	C, 00108$
;src/games/hoppy_bird/flappy_pipe.c:64: s->pipe_phase = 0;
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
;src/games/hoppy_bird/flappy_pipe.c:65: }
	add	sp, #3
	ret
;src/games/hoppy_bird/flappy_pipe.c:67: void init_pipes(void)
;	---------------------------------
; Function init_pipes
; ---------------------------------
_init_pipes::
;src/games/hoppy_bird/flappy_pipe.c:69: pipe_state_t *s = pipe_get_state();
	call	_pipe_get_state
;src/games/hoppy_bird/flappy_pipe.c:71: s->scroll_x = 0;
	xor	a, a
	ld	(bc), a
;src/games/hoppy_bird/flappy_pipe.c:72: s->pipe_phase = PIPE_SPACING - 9;
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x0d
;src/games/hoppy_bird/flappy_pipe.c:73: s->cur_gap_y = PIPE_MIN_GAP_Y + 3;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x04
;src/games/hoppy_bird/flappy_pipe.c:74: s->pipe_screen_x = 200;
	ld	hl, #0x0005
	add	hl, bc
	ld	a, #0xc8
	ld	(hl+), a
	ld	(hl), #0x00
;src/games/hoppy_bird/flappy_pipe.c:75: s->scored = 0;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x00
;src/games/hoppy_bird/flappy_pipe.c:76: s->rng = DIV_REG;
	ld	hl, #0x0004
	add	hl, bc
	ldh	a, (_DIV_REG + 0)
	ld	(hl), a
;src/games/hoppy_bird/flappy_pipe.c:77: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;src/games/hoppy_bird/flappy_pipe.c:78: }
	ret
;src/games/hoppy_bird/flappy_pipe.c:80: void update_pipes(void)
;	---------------------------------
; Function update_pipes
; ---------------------------------
_update_pipes::
	dec	sp
	dec	sp
;src/games/hoppy_bird/flappy_pipe.c:82: pipe_state_t *s = pipe_get_state();
;src/games/hoppy_bird/flappy_pipe.c:84: s->scroll_x++;
	call	_pipe_get_state
	pop	hl
	push	bc
	pop	de
	push	de
	ld	a, (de)
	inc	a
	pop	hl
	push	hl
	ld	(hl), a
;src/games/hoppy_bird/flappy_pipe.c:85: SCX_REG = s->scroll_x;
	ldh	(_SCX_REG + 0), a
;src/games/hoppy_bird/flappy_pipe.c:86: s->pipe_screen_x--;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	dec	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/games/hoppy_bird/flappy_pipe.c:87: if ((s->scroll_x & 7) == 0)
	pop	de
	push	de
	ld	a, (de)
	and	a, #0x07
	jr	NZ, 00103$
;src/games/hoppy_bird/flappy_pipe.c:88: advance_column();
	inc	sp
	inc	sp
	jp	_advance_column
00103$:
;src/games/hoppy_bird/flappy_pipe.c:89: }
	inc	sp
	inc	sp
	ret
;src/games/hoppy_bird/flappy_pipe.c:91: uint8_t pipe_hit_check(uint8_t bird_y)
;	---------------------------------
; Function pipe_hit_check
; ---------------------------------
_pipe_hit_check::
	add	sp, #-4
	ld	e, a
;src/games/hoppy_bird/flappy_pipe.c:93: pipe_state_t *s = pipe_get_state();
	push	de
	call	_pipe_get_state
	pop	de
;src/games/hoppy_bird/flappy_pipe.c:94: uint8_t row_t = (bird_y + 2) >> 3;
	ld	d, #0x00
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	push	hl
	ld	a, l
	ldhl	sp,	#2
	ld	(hl), a
	pop	hl
;src/games/hoppy_bird/flappy_pipe.c:95: uint8_t row_b = (bird_y + 13) >> 3;
	ld	hl, #0x000d
	add	hl, de
	ld	e, l
	ld	d, h
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	ldhl	sp,	#1
	ld	(hl), e
;src/games/hoppy_bird/flappy_pipe.c:97: if (s->pipe_screen_x > BIRD_X + 13)
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#2
	ld	a, #0x35
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00131$
	bit	7, d
	jr	NZ, 00132$
	cp	a, a
	jr	00132$
00131$:
	bit	7, d
	jr	Z, 00132$
	scf
00132$:
	jr	NC, 00102$
;src/games/hoppy_bird/flappy_pipe.c:98: return 0;
	xor	a, a
	jr	00108$
00102$:
;src/games/hoppy_bird/flappy_pipe.c:99: if (s->pipe_screen_x + PIPE_WIDTH * 8 <= BIRD_X + 2)
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	add	hl, de
	ld	e, h
	ld	d, #0x00
	ld	a, #0x2a
	cp	a, l
	ld	a, #0x00
	sbc	a, h
	bit	7, e
	jr	Z, 00133$
	bit	7, d
	jr	NZ, 00134$
	cp	a, a
	jr	00134$
00133$:
	bit	7, d
	jr	Z, 00134$
	scf
00134$:
	jr	C, 00104$
;src/games/hoppy_bird/flappy_pipe.c:100: return 0;
	xor	a, a
	jr	00108$
00104$:
;src/games/hoppy_bird/flappy_pipe.c:101: if (row_t < s->cur_gap_y || row_b > s->cur_gap_y + PIPE_GAP - 1)
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	C, 00105$
	inc	hl
	ld	b, #0x00
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00106$
00105$:
;src/games/hoppy_bird/flappy_pipe.c:102: return 1;
	ld	a, #0x01
	jr	00108$
00106$:
;src/games/hoppy_bird/flappy_pipe.c:103: return 0;
	xor	a, a
00108$:
;src/games/hoppy_bird/flappy_pipe.c:104: }
	add	sp, #4
	ret
;src/games/hoppy_bird/flappy_pipe.c:106: uint8_t pipe_score_check(void)
;	---------------------------------
; Function pipe_score_check
; ---------------------------------
_pipe_score_check::
	dec	sp
	dec	sp
;src/games/hoppy_bird/flappy_pipe.c:108: pipe_state_t *s = pipe_get_state();
	call	_pipe_get_state
;src/games/hoppy_bird/flappy_pipe.c:110: if (s->scored)
	ld	hl, #0x0003
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	or	a, a
	jr	Z, 00102$
;src/games/hoppy_bird/flappy_pipe.c:111: return 0;
	xor	a, a
	jr	00105$
00102$:
;src/games/hoppy_bird/flappy_pipe.c:112: if (s->pipe_screen_x + PIPE_WIDTH * 8 < BIRD_X) {
	ld	hl, #0x0005
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0010
	add	hl, bc
	ld	a, l
	sub	a, #0x28
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00104$
;src/games/hoppy_bird/flappy_pipe.c:113: s->scored = 1;
	pop	hl
;src/games/hoppy_bird/flappy_pipe.c:114: return 1;
	ld	a, #0x01
	ld	(hl), a
	push	hl
	jr	00105$
00104$:
;src/games/hoppy_bird/flappy_pipe.c:116: return 0;
	xor	a, a
00105$:
;src/games/hoppy_bird/flappy_pipe.c:117: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
