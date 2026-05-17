;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module hoppy_game
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _init_save_data
	.globl _clear_all_sprites
	.globl _draw_menu
	.globl _draw_text
	.globl _menu_font_load
	.globl _init_bkg
	.globl _set_sprite_data
	.globl _delay
	.globl _init_menu
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
;src/menu/hoppy_game.c:15: static void display_main_screen(void)
;	---------------------------------
; Function display_main_screen
; ---------------------------------
_display_main_screen:
;src/menu/hoppy_game.c:17: init_bkg(0);
	xor	a, a
	push	af
	inc	sp
	call	_init_bkg
	inc	sp
;src/menu/hoppy_game.c:18: draw_text(5, 8, "HOPPY GAME");
	ld	de, #___str_0
	push	de
	ld	e, #0x08
	ld	a, #0x05
	call	_draw_text
;src/menu/hoppy_game.c:19: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;src/menu/hoppy_game.c:20: set_sprite_data(0, 4, SleepingHoppy);
	ld	de, #_SleepingHoppy
	push	de
	ld	hl, #0x400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	(hl-), a
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x5e
	ld	(hl+), a
	ld	(hl), #0x53
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 6)
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, #0x02
	ld	(hl-), a
	dec	hl
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, #0x5e
	ld	(hl+), a
	ld	(hl), #0x5b
;src/menu/hoppy_game.c:25: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/menu/hoppy_game.c:26: }
	ret
_SleepingHoppy:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x31	; 49	'1'
	.db #0x31	; 49	'1'
	.db #0x2a	; 42
	.db #0x3b	; 59
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x52	; 82	'R'
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0xc0	; 192
	.db #0x5b	; 91
	.db #0x5b	; 91
	.db #0x84	; 132
	.db #0xc4	; 196
	.db #0x40	; 64
	.db #0x60	; 96
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x1b	; 27
	.db #0x1b	; 27
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
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0xbc	; 188
	.db #0xbc	; 188
	.db #0xc2	; 194
	.db #0xfe	; 254
	.db #0xc5	; 197
	.db #0x43	; 67	'C'
	.db #0x21	; 33
	.db #0x63	; 99	'c'
	.db #0x41	; 65	'A'
	.db #0x43	; 67	'C'
	.db #0xa5	; 165
	.db #0x63	; 99	'c'
	.db #0x42	; 66	'B'
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
___str_0:
	.ascii "HOPPY GAME"
	.db 0x00
;src/menu/hoppy_game.c:28: static void fade_in_out(uint8_t *palette)
;	---------------------------------
; Function fade_in_out
; ---------------------------------
_fade_in_out:
	dec	sp
	ld	c, e
	ld	b, d
;src/menu/hoppy_game.c:30: for (uint8_t i = 0; i < 4; i++) {
	ldhl	sp,	#0
	ld	(hl), #0x00
00103$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x04
	jr	NC, 00105$
;src/menu/hoppy_game.c:31: BGP_REG = palette[i];
	ld	l, (hl)
	ld	h, #0x00
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldh	(_BGP_REG + 0), a
;src/menu/hoppy_game.c:32: OBP0_REG = palette[i];
	ld	a, (de)
	ldh	(_OBP0_REG + 0), a
;src/menu/hoppy_game.c:33: delay(150);
	push	bc
	ld	de, #0x0096
	call	_delay
	pop	bc
;src/menu/hoppy_game.c:30: for (uint8_t i = 0; i < 4; i++) {
	ldhl	sp,	#0
	inc	(hl)
	jr	00103$
00105$:
;src/menu/hoppy_game.c:35: }
	inc	sp
	ret
;src/menu/hoppy_game.c:37: void init_menu(uint8_t selected)
;	---------------------------------
; Function init_menu
; ---------------------------------
_init_menu::
	add	sp, #-9
	ldhl	sp,	#8
	ld	(hl), a
;src/menu/hoppy_game.c:39: uint8_t palette_in[] = { 0x00, 0x50, 0xA8, 0xE4 };
	ldhl	sp,	#0
	xor	a, a
	ld	(hl+), a
	ld	a, #0x50
	ld	(hl+), a
	ld	a, #0xa8
	ld	(hl+), a
;src/menu/hoppy_game.c:40: uint8_t palette_out[] = { 0xE4, 0xA8, 0x50, 0x00 };
	ld	a,#0xe4
	ld	(hl+),a
	ld	(hl+), a
	ld	a, #0xa8
	ld	(hl+), a
	ld	a, #0x50
	ld	(hl+), a
	ld	(hl), #0x00
;src/menu/hoppy_game.c:42: init_save_data();
	call	_init_save_data
;src/menu/hoppy_game.c:43: menu_font_load();
	call	_menu_font_load
;src/menu/hoppy_game.c:44: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/menu/hoppy_game.c:45: SCX_REG = 0;
	xor	a, a
	ldh	(_SCX_REG + 0), a
;src/menu/hoppy_game.c:46: display_main_screen();
	call	_display_main_screen
;src/menu/hoppy_game.c:47: fade_in_out(palette_in);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_fade_in_out
;src/menu/hoppy_game.c:48: delay(3000);
	ld	de, #0x0bb8
	call	_delay
;src/menu/hoppy_game.c:49: fade_in_out(palette_out);
	ld	hl, #4
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_fade_in_out
;src/menu/hoppy_game.c:50: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;src/menu/hoppy_game.c:51: clear_all_sprites();
	call	_clear_all_sprites
;src/menu/hoppy_game.c:52: BGP_REG = 0x00;
	xor	a, a
	ldh	(_BGP_REG + 0), a
;src/menu/hoppy_game.c:53: OBP0_REG = 0x00;
	xor	a, a
	ldh	(_OBP0_REG + 0), a
;src/menu/hoppy_game.c:54: draw_menu(selected);
	ldhl	sp,	#8
	ld	a, (hl)
	call	_draw_menu
;src/menu/hoppy_game.c:55: fade_in_out(palette_in);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	call	_fade_in_out
;src/menu/hoppy_game.c:56: }
	add	sp, #9
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
