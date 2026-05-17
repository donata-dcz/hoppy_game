;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module get_coords_next
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_tile_at
	.globl _get_coords_next
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
;src/games/hoppy_snake/get_coords_next.c:13: static int move_up(size_t *y)
;	---------------------------------
; Function move_up
; ---------------------------------
_move_up:
	ld	c, e
	ld	b, d
;src/games/hoppy_snake/get_coords_next.c:15: if (*y == 0)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	or	a, h
	jr	NZ, 00102$
;src/games/hoppy_snake/get_coords_next.c:16: return FAILURE;
	ld	bc, #0xffff
	ret
00102$:
;src/games/hoppy_snake/get_coords_next.c:17: --(*y);
	dec	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/games/hoppy_snake/get_coords_next.c:18: return SUCCESS;
	ld	bc, #0x0000
;src/games/hoppy_snake/get_coords_next.c:19: }
	ret
;src/games/hoppy_snake/get_coords_next.c:21: static int move_left(size_t *x)
;	---------------------------------
; Function move_left
; ---------------------------------
_move_left:
	ld	c, e
	ld	b, d
;src/games/hoppy_snake/get_coords_next.c:23: if (*x == 0)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	or	a, h
	jr	NZ, 00102$
;src/games/hoppy_snake/get_coords_next.c:24: return FAILURE;
	ld	bc, #0xffff
	ret
00102$:
;src/games/hoppy_snake/get_coords_next.c:25: --(*x);
	dec	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/games/hoppy_snake/get_coords_next.c:26: return SUCCESS;
	ld	bc, #0x0000
;src/games/hoppy_snake/get_coords_next.c:27: }
	ret
;src/games/hoppy_snake/get_coords_next.c:29: static int calculate_coords_increment(const tile_data_t *snake_tile,
;	---------------------------------
; Function calculate_coords_increment
; ---------------------------------
_calculate_coords_increment:
;src/games/hoppy_snake/get_coords_next.c:32: switch (*snake_tile) {
	ld	a, (de)
	cp	a, #0x04
	jr	Z, 00101$
	cp	a, #0x08
	jr	Z, 00102$
	cp	a, #0x10
	jr	Z, 00103$
	sub	a, #0x20
	jr	Z, 00104$
	jr	00105$
;src/games/hoppy_snake/get_coords_next.c:33: case SNAKE_UP:
00101$:
;src/games/hoppy_snake/get_coords_next.c:34: return move_up(y);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_up
	jr	00107$
;src/games/hoppy_snake/get_coords_next.c:35: case SNAKE_DOWN:
00102$:
;src/games/hoppy_snake/get_coords_next.c:36: ++(*y);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/games/hoppy_snake/get_coords_next.c:37: return SUCCESS;
	ld	bc, #0x0000
	jr	00107$
;src/games/hoppy_snake/get_coords_next.c:38: case SNAKE_LEFT:
00103$:
;src/games/hoppy_snake/get_coords_next.c:39: return move_left(x);
	ld	e, c
	ld	d, b
	call	_move_left
	jr	00107$
;src/games/hoppy_snake/get_coords_next.c:40: case SNAKE_RIGHT:
00104$:
;src/games/hoppy_snake/get_coords_next.c:41: ++(*x);
	ld	l, c
	ld	h, b
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	inc	hl
	ld	a, l
	ld	(bc), a
	inc	bc
	ld	a, h
	ld	(bc), a
;src/games/hoppy_snake/get_coords_next.c:42: return SUCCESS;
	ld	bc, #0x0000
	jr	00107$
;src/games/hoppy_snake/get_coords_next.c:43: default:
00105$:
;src/games/hoppy_snake/get_coords_next.c:44: return FAILURE;
	ld	bc, #0xffff
;src/games/hoppy_snake/get_coords_next.c:45: }
00107$:
;src/games/hoppy_snake/get_coords_next.c:46: }
	pop	hl
	pop	af
	jp	(hl)
;src/games/hoppy_snake/get_coords_next.c:48: int get_coords_next(snake_board_t *snake_board, coords_t *coords)
;	---------------------------------
; Function get_coords_next
; ---------------------------------
_get_coords_next::
	add	sp, #-10
;src/games/hoppy_snake/get_coords_next.c:50: const tile_data_t *snake_tile = get_tile_at(snake_board, *coords);
	push	bc
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
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
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
;src/games/hoppy_snake/get_coords_next.c:51: int snake_y = (int)coords->values[0];
	ldhl	sp,	#6
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;src/games/hoppy_snake/get_coords_next.c:52: int snake_x = (int)coords->values[1];
	inc	bc
	inc	bc
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl), c
	inc	hl
	ld	(hl), a
;src/games/hoppy_snake/get_coords_next.c:54: if (calculate_coords_increment(snake_tile, &snake_x, &snake_y) == FAILURE)
	ldhl	sp,	#2
	ld	c, l
	ld	e, h
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	b, e
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_calculate_coords_increment
	ld	a, c
	and	a, b
	inc	a
	jr	NZ, 00102$
;src/games/hoppy_snake/get_coords_next.c:55: return FAILURE;
	ld	bc, #0xffff
	jr	00105$
00102$:
;src/games/hoppy_snake/get_coords_next.c:56: if (snake_tile == NULL)
	ldhl	sp,	#5
	ld	a, (hl-)
	or	a, (hl)
	jr	NZ, 00104$
;src/games/hoppy_snake/get_coords_next.c:57: return FAILURE;
	ld	bc, #0xffff
	jr	00105$
00104$:
;src/games/hoppy_snake/get_coords_next.c:58: coords->values[0] = (size_t)snake_y;
	pop	bc
	push	bc
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_snake/get_coords_next.c:59: coords->values[1] = (size_t)snake_x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_snake/get_coords_next.c:60: return SUCCESS;
	ld	bc, #0x0000
00105$:
;src/games/hoppy_snake/get_coords_next.c:61: }
	add	sp, #10
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
