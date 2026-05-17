;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module snake_event_handler
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_head_sprite
	.globl _get_tile_at
	.globl _snake_key_handler
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
;src/games/hoppy_snake/snake_event_handler.c:15: void snake_key_handler(snake_game_t *snake_game, uint8_t key_input)
;	---------------------------------
; Function snake_key_handler
; ---------------------------------
_snake_key_handler::
	add	sp, #-4
	ldhl	sp,	#2
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	dec	hl
;src/games/hoppy_snake/snake_event_handler.c:17: tile_data_t *head_tile = get_tile_at(
	ld	(hl+), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0156
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
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
;src/games/hoppy_snake/snake_event_handler.c:20: move_sprite(get_head_sprite(*head_tile), 0, 0);
	ld	a, (bc)
	push	bc
	call	_get_head_sprite
	ld	e, a
	pop	bc
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/games/hoppy_snake/snake_event_handler.c:21: if (key_input == J_UP && *head_tile != SNAKE_DOWN)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00102$
	ld	a, (bc)
	sub	a, #0x08
	jr	Z, 00102$
;src/games/hoppy_snake/snake_event_handler.c:22: *head_tile = SNAKE_UP;
	ld	a, #0x04
	ld	(bc), a
00102$:
;src/games/hoppy_snake/snake_event_handler.c:23: if (key_input == J_DOWN && *head_tile != SNAKE_UP)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x08
	jr	NZ, 00105$
	ld	a, (bc)
	sub	a, #0x04
	jr	Z, 00105$
;src/games/hoppy_snake/snake_event_handler.c:24: *head_tile = SNAKE_DOWN;
	ld	a, #0x08
	ld	(bc), a
00105$:
;src/games/hoppy_snake/snake_event_handler.c:25: if (key_input == J_LEFT && *head_tile != SNAKE_RIGHT)
	ldhl	sp,	#1
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00108$
	ld	a, (bc)
	sub	a, #0x20
	jr	Z, 00108$
;src/games/hoppy_snake/snake_event_handler.c:26: *head_tile = SNAKE_LEFT;
	ld	a, #0x10
	ld	(bc), a
00108$:
;src/games/hoppy_snake/snake_event_handler.c:27: if (key_input == J_RIGHT && *head_tile != SNAKE_LEFT)
	ldhl	sp,	#1
	ld	a, (hl)
	dec	a
	jr	NZ, 00111$
	ld	a, (bc)
	sub	a, #0x10
	jr	Z, 00111$
;src/games/hoppy_snake/snake_event_handler.c:28: *head_tile = SNAKE_RIGHT;
	ld	a, #0x20
	ld	(bc), a
00111$:
;src/games/hoppy_snake/snake_event_handler.c:31: snake_game->head_coords.values[0]
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0156
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
;src/games/hoppy_snake/snake_event_handler.c:30: snake_game->head_coords.values[1],
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0158
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
;src/games/hoppy_snake/snake_event_handler.c:29: move_sprite(get_head_sprite(*head_tile),
	ld	a, (bc)
	push	de
	call	_get_head_sprite
	ld	c, a
	pop	de
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, c
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	push	hl
	ldhl	sp,	#2
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	ld	(hl), e
;src/games/hoppy_snake/snake_event_handler.c:32: );
;src/games/hoppy_snake/snake_event_handler.c:33: }
	add	sp, #4
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
