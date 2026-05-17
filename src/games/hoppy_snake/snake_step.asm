;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module snake_step
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_head_sprite
	.globl _get_member_next
	.globl _get_coords_next
	.globl _get_tile_at
	.globl _set_coords
	.globl _set_bkg_tiles
	.globl _snake_step
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
;src/games/hoppy_snake/snake_step.c:15: static void display_head(coords_t coords, tile_data_t direction)
;	---------------------------------
; Function display_head
; ---------------------------------
_display_head:
;src/games/hoppy_snake/snake_step.c:17: size_t x = coords.values[1];
	ldhl	sp,	#4
;src/games/hoppy_snake/snake_step.c:18: size_t y = coords.values[0];
	ld	a, (hl-)
	dec	hl
	ld	c, a
	ld	a, (hl)
;src/games/hoppy_snake/snake_step.c:22: y * 8 + GAMEBOY_PADDING_Y
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x10
	ld	b, a
;src/games/hoppy_snake/snake_step.c:21: x * 8 + GAMEBOY_PADDING_X,
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, #0x08
	ld	c, a
;src/games/hoppy_snake/snake_step.c:20: move_sprite(get_head_sprite(direction),
	push	bc
	ldhl	sp,	#8
	ld	a, (hl)
	call	_get_head_sprite
	ld	e, a
	pop	bc
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, e
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	(hl), b
	inc	hl
	ld	(hl), c
;src/games/hoppy_snake/snake_step.c:23: );
;src/games/hoppy_snake/snake_step.c:24: }
	pop	hl
	add	sp, #5
	jp	(hl)
;src/games/hoppy_snake/snake_step.c:26: static void snake_step_vram(coords_t *destination_coords,
;	---------------------------------
; Function snake_step_vram
; ---------------------------------
_snake_step_vram:
	dec	sp
	dec	sp
;src/games/hoppy_snake/snake_step.c:29: uint8_t body_tile_index = SNAKE_BGBODY_ASSET;
	ldhl	sp,	#0
;src/games/hoppy_snake/snake_step.c:30: uint8_t empty_tile_index = SNAKE_BGEMPTY_ASSET;
	ld	a, #0x01
	ld	(hl+), a
	ld	(hl), #0x00
;src/games/hoppy_snake/snake_step.c:32: display_head(*destination_coords, *tile_to_move);
	ld	a, (bc)
	push	de
	push	af
	inc	sp
	ld	l, e
	ld	h, d
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
	call	_display_head
	pop	de
;src/games/hoppy_snake/snake_step.c:34: destination_coords->values[0], 1, 1, &empty_tile_index);
	ldhl	sp,	#1
	ld	c, l
	ld	b, h
	ld	a, (de)
;src/games/hoppy_snake/snake_step.c:33: set_bkg_tiles(destination_coords->values[1],
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	d, (hl)
	push	bc
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
	call	_set_bkg_tiles
	add	sp, #6
;src/games/hoppy_snake/snake_step.c:36: head_coords->values[0], 1, 1, &body_tile_index);
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;src/games/hoppy_snake/snake_step.c:35: set_bkg_tiles(head_coords->values[1],
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	d, (hl)
	push	bc
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
	call	_set_bkg_tiles
;src/games/hoppy_snake/snake_step.c:37: }
	add	sp, #8
	pop	hl
	pop	af
	jp	(hl)
;src/games/hoppy_snake/snake_step.c:39: static int move_snake_head(snake_game_t *game_data)
;	---------------------------------
; Function move_snake_head
; ---------------------------------
_move_snake_head:
	add	sp, #-12
;src/games/hoppy_snake/snake_step.c:41: tile_data_t *tile_to_move = get_tile_at(&(game_data->board),
	push	de
	ld	hl, #0x0156
	add	hl, de
	pop	de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	push	de
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
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
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_get_tile_at
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	de
;src/games/hoppy_snake/snake_step.c:43: coords_t destination_coords = game_data->head_coords;
	ld	hl, #0x0156
	add	hl, de
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0004
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
	pop	de
;src/games/hoppy_snake/snake_step.c:44: tile_data_t *destination_tile = get_member_next(game_data,
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
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
	call	_get_member_next
	ldhl	sp,	#10
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_snake/snake_step.c:47: if (tile_to_move == NULL || destination_tile == NULL
	ldhl	sp,	#9
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00101$
	ldhl	sp,	#11
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00101$
;src/games/hoppy_snake/snake_step.c:49: &(game_data->board), &destination_coords) == FAILURE)
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_get_coords_next
	ld	a, c
	and	a, b
	inc	a
	jr	NZ, 00102$
00101$:
;src/games/hoppy_snake/snake_step.c:50: return FAILURE;
	ld	bc, #0xffff
	jr	00108$
00102$:
;src/games/hoppy_snake/snake_step.c:51: if (*destination_tile != SNAKE_VOID && *destination_tile != FISH)
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	cp	a, #0x01
	jr	Z, 00106$
	sub	a, #0x02
	jr	Z, 00106$
;src/games/hoppy_snake/snake_step.c:52: return FAILURE;
	ld	bc, #0xffff
	jr	00108$
00106$:
;src/games/hoppy_snake/snake_step.c:53: snake_step_vram(&destination_coords, tile_to_move,
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_snake_step_vram
;src/games/hoppy_snake/snake_step.c:55: set_coords(&(game_data->head_coords), destination_coords);
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
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_set_coords
;src/games/hoppy_snake/snake_step.c:56: *destination_tile = *tile_to_move;
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
;src/games/hoppy_snake/snake_step.c:57: return SUCCESS;
	ld	bc, #0x0000
00108$:
;src/games/hoppy_snake/snake_step.c:58: }
	add	sp, #12
	ret
;src/games/hoppy_snake/snake_step.c:60: static int process_snake_events(bool fish_eaten,
;	---------------------------------
; Function process_snake_events
; ---------------------------------
_process_snake_events:
	ld	c, a
;src/games/hoppy_snake/snake_step.c:63: if (move_snake_head_success_status == FAILURE)
	ld	a, e
	and	a, d
	inc	a
	jr	NZ, 00102$
;src/games/hoppy_snake/snake_step.c:64: return GAME_OVER;
	ld	bc, #0x0002
	ret
00102$:
;src/games/hoppy_snake/snake_step.c:65: if (fish_eaten)
	bit	0, c
	jr	Z, 00104$
;src/games/hoppy_snake/snake_step.c:66: return FISH_EATEN;
	ld	bc, #0x0001
	ret
00104$:
;src/games/hoppy_snake/snake_step.c:67: return NO_EVENT;
	ld	bc, #0x0000
;src/games/hoppy_snake/snake_step.c:68: }
	ret
;src/games/hoppy_snake/snake_step.c:70: static void move_snake_tail(size_t *unflold, coords_t *tail_coords,
;	---------------------------------
; Function move_snake_tail
; ---------------------------------
_move_snake_tail:
	add	sp, #-3
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
;src/games/hoppy_snake/snake_step.c:73: uint8_t empty_tile_index = SNAKE_BGEMPTY_ASSET;
	ld	a, d
	ld	(hl-), a
	dec	hl
;src/games/hoppy_snake/snake_step.c:75: if (*unflold) {
	xor	a, a
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
	inc	de
	ld	a, (de)
	ld	h, a
	or	a, l
	jr	Z, 00102$
;src/games/hoppy_snake/snake_step.c:76: *unflold -= 1;
	ld	c, l
	ld	b, h
	dec	bc
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), c
	inc	hl
	ld	(hl), b
	jr	00104$
00102$:
;src/games/hoppy_snake/snake_step.c:79: tail_coords->values[0], 1, 1, &empty_tile_index);
	ld	a, (bc)
;src/games/hoppy_snake/snake_step.c:78: set_bkg_tiles(tail_coords->values[1],
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	hl, #0
	add	hl, sp
	push	hl
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
	call	_set_bkg_tiles
	add	sp, #6
;src/games/hoppy_snake/snake_step.c:80: *tail = SNAKE_VOID;
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, #0x01
	ld	(de), a
;src/games/hoppy_snake/snake_step.c:81: *tail_coords = *tail_next_coords;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	bc, #0x0004
	push	bc
	ld	c, e
	ld	b, d
	ld	e, l
	ld	d, h
	call	___memcpy
00104$:
;src/games/hoppy_snake/snake_step.c:83: }
	add	sp, #3
	pop	hl
	add	sp, #4
	jp	(hl)
;src/games/hoppy_snake/snake_step.c:85: snake_game_key_t snake_step(snake_game_t *game_data)
;	---------------------------------
; Function snake_step
; ---------------------------------
_snake_step::
	add	sp, #-15
	ldhl	sp,	#13
	ld	a, e
	ld	(hl+), a
;src/games/hoppy_snake/snake_step.c:87: tile_data_t *destination_tile = get_member_next(game_data,
	ld	a, d
	ld	(hl-), a
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
	ldhl	sp,	#17
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_get_member_next
	pop	hl
	push	bc
;src/games/hoppy_snake/snake_step.c:90: tile_data_t *tail = get_tile_at(&(game_data->board),
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x015a
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ldhl	sp,	#13
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#14
	ld	a, (hl-)
	dec	hl
	ld	(hl), a
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
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
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_get_tile_at
	ldhl	sp,	#8
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/games/hoppy_snake/snake_step.c:92: coords_t tail_next_coords = game_data->tail_tip_coords;
	ldhl	sp,#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x015a
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #0x0004
	push	de
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	___memcpy
;src/games/hoppy_snake/snake_step.c:94: if (destination_tile == NULL ||
	ldhl	sp,	#1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00101$
;src/games/hoppy_snake/snake_step.c:95: get_coords_next(&(game_data->board), &(tail_next_coords)) == FAILURE)
	ld	hl, #2
	add	hl, sp
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_get_coords_next
	ld	a, c
	and	a, b
	inc	a
	jr	NZ, 00102$
00101$:
;src/games/hoppy_snake/snake_step.c:96: return GAME_OVER;
	ld	a, #0x02
	jr	00106$
00102$:
;src/games/hoppy_snake/snake_step.c:97: fish_eaten = (*destination_tile == FISH);
	pop	de
	push	de
	ld	a, (de)
	sub	a, #0x02
	ld	a, #0x01
	jr	Z, 00125$
	xor	a, a
00125$:
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (hl-)
	dec	hl
;src/games/hoppy_snake/snake_step.c:98: if (!fish_eaten)
	ld	(hl+), a
	inc	hl
	bit	0, (hl)
	jr	NZ, 00105$
;src/games/hoppy_snake/snake_step.c:99: move_snake_tail(&(game_data->unflold), &(game_data->tail_tip_coords),
	inc	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0154
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #4
	add	hl, sp
	push	hl
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_snake_tail
00105$:
;src/games/hoppy_snake/snake_step.c:101: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/games/hoppy_snake/snake_step.c:102: return process_snake_events(fish_eaten, move_snake_head(game_data));
	ldhl	sp,	#13
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_move_snake_head
	ld	e, c
	ld	d, b
	ldhl	sp,	#10
	ld	a, (hl)
	call	_process_snake_events
	ld	a, c
00106$:
;src/games/hoppy_snake/snake_step.c:103: }
	add	sp, #15
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
