;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module font_utils
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _get_specific_tiles
	.globl _set_bkg_data
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _FontTiles
	.globl _menu_font_load
	.globl _get_char_tile
	.globl _draw_text
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
;src/utils/font_utils.c:13: void menu_font_load(void)
;	---------------------------------
; Function menu_font_load
; ---------------------------------
_menu_font_load::
;src/utils/font_utils.c:15: set_bkg_data(FONT_TILE_OFFSET, FONT_TILE_COUNT, FontTiles);
	ld	de, #_FontTiles
	push	de
	ld	hl, #0x2a80
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/utils/font_utils.c:16: }
	ret
_FontTiles:
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
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xe6	; 230
	.db #0xe6	; 230
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xe6	; 230
	.db #0xe6	; 230
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xe6	; 230
	.db #0xe6	; 230
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xd6	; 214
	.db #0xd6	; 214
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xce	; 206
	.db #0xce	; 206
	.db #0xdc	; 220
	.db #0xdc	; 220
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x82	; 130
	.db #0x82	; 130
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0xee	; 238
	.db #0xee	; 238
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x6c	; 108	'l'
	.db #0x6c	; 108	'l'
	.db #0xcc	; 204
	.db #0xcc	; 204
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x3e	; 62
	.db #0x3e	; 62
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x38	; 56	'8'
	.db #0x38	; 56	'8'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0xc6	; 198
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x7c	; 124
	.db #0x7c	; 124
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x1c	; 28
	.db #0x1c	; 28
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
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
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x00	; 0
;src/utils/font_utils.c:18: uint8_t get_specific_tiles(char c)
;	---------------------------------
; Function get_specific_tiles
; ---------------------------------
_get_specific_tiles::
;src/utils/font_utils.c:20: switch (c) {
	cp	a, #0x20
	jr	Z, 00106$
	cp	a, #0x21
	jr	Z, 00101$
	cp	a, #0x2e
	jr	Z, 00104$
	cp	a, #0x3a
	jr	Z, 00102$
	cp	a, #0x3e
	jr	Z, 00105$
	sub	a, #0x3f
	jr	Z, 00103$
	jr	00107$
;src/utils/font_utils.c:21: case '!':
00101$:
;src/utils/font_utils.c:22: return FONT_OFFSET_SYMBOL + 0;
	ld	a, #0xa5
	ret
;src/utils/font_utils.c:23: case ':':
00102$:
;src/utils/font_utils.c:24: return FONT_OFFSET_SYMBOL + 1;
	ld	a, #0xa6
	ret
;src/utils/font_utils.c:25: case '?':
00103$:
;src/utils/font_utils.c:26: return FONT_OFFSET_SYMBOL + 2;
	ld	a, #0xa7
	ret
;src/utils/font_utils.c:27: case '.':
00104$:
;src/utils/font_utils.c:28: return FONT_OFFSET_SYMBOL + 3;
	ld	a, #0xa8
	ret
;src/utils/font_utils.c:29: case '>':
00105$:
;src/utils/font_utils.c:30: return FONT_TILE_OFFSET + 41;
	ld	a, #0xa9
	ret
;src/utils/font_utils.c:31: case ' ':
00106$:
;src/utils/font_utils.c:32: return FONT_TILE_OFFSET;
	ld	a, #0x80
	ret
;src/utils/font_utils.c:33: default:
00107$:
;src/utils/font_utils.c:34: return FONT_TILE_OFFSET;
	ld	a, #0x80
;src/utils/font_utils.c:35: }
;src/utils/font_utils.c:36: }
	ret
;src/utils/font_utils.c:38: uint8_t get_char_tile(char c)
;	---------------------------------
; Function get_char_tile
; ---------------------------------
_get_char_tile::
;src/utils/font_utils.c:40: if (c >= 'A' && c <= 'Z')
	ld	c, a
	xor	a, #0x80
	sub	a, #0xc1
	jr	C, 00102$
	ld	e, c
	ld	a,#0x5a
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00154$
	bit	7, d
	jr	NZ, 00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z, 00155$
	scf
00155$:
	jr	C, 00102$
;src/utils/font_utils.c:41: return FONT_OFFSET_ALPHA + (c - 'A');
	ld	a, c
	add	a, #0x40
	ret
00102$:
;src/utils/font_utils.c:42: if (c >= 'a' && c <= 'z')
	ld	a, c
	xor	a, #0x80
	sub	a, #0xe1
	jr	C, 00105$
	ld	e, c
	ld	a,#0x7a
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00156$
	bit	7, d
	jr	NZ, 00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z, 00157$
	scf
00157$:
	jr	C, 00105$
;src/utils/font_utils.c:43: return FONT_OFFSET_ALPHA + (c - 'a');
	ld	a, c
	add	a, #0x20
	ret
00105$:
;src/utils/font_utils.c:44: if (c >= '0' && c <= '9')
	ld	a, c
	xor	a, #0x80
	sub	a, #0xb0
	jr	C, 00108$
	ld	e, c
	ld	a,#0x39
	ld	d,a
	sub	a, c
	bit	7, e
	jr	Z, 00158$
	bit	7, d
	jr	NZ, 00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z, 00159$
	scf
00159$:
	jr	C, 00108$
;src/utils/font_utils.c:45: return FONT_OFFSET_DIGIT + (c - '0');
	ld	a, c
	add	a, #0x6b
	ret
00108$:
;src/utils/font_utils.c:46: return get_specific_tiles(c);
	ld	a, c
;src/utils/font_utils.c:47: }
	jp	_get_specific_tiles
;src/utils/font_utils.c:49: void draw_text(uint8_t col, uint8_t row, const char *text)
;	---------------------------------
; Function draw_text
; ---------------------------------
_draw_text::
	dec	sp
	dec	sp
;src/utils/font_utils.c:51: uint8_t *vram = get_bkg_xy_addr(col, row);
	call	_get_bkg_xy_addr
	pop	hl
	push	bc
;src/utils/font_utils.c:54: while (text[i] != '\0') {
	ld	bc, #0x0000
00101$:
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	or	a, a
	jr	Z, 00104$
;src/utils/font_utils.c:55: set_vram_byte(vram++, get_char_tile(text[i]));
	push	bc
	call	_get_char_tile
	pop	bc
	pop	de
	push	de
	ldhl	sp,	#0
	inc	(hl)
	jr	NZ, 00121$
	inc	hl
	inc	(hl)
00121$:
	call	_set_vram_byte
;src/utils/font_utils.c:56: i++;
	inc	bc
	jr	00101$
00104$:
;src/utils/font_utils.c:58: }
	inc	sp
	inc	sp
	pop	hl
	pop	af
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
