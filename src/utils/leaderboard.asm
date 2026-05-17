;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module leaderboard
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _savedScores
	.globl _savedVersion
	.globl _savedCheckFlag
	.globl _init_save_data
	.globl _save_score
	.globl _load_scores
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_savedCheckFlag	=	0xa000
_savedVersion	=	0xa001
_savedScores	=	0xa002
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
;src/utils/leaderboard.c:15: void init_save_data(void)
;	---------------------------------
; Function init_save_data
; ---------------------------------
_init_save_data::
;src/utils/leaderboard.c:19: ENABLE_RAM;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;src/utils/leaderboard.c:20: if (savedCheckFlag == SAVE_FLAG && savedVersion == SAVE_VERSION) {
	ld	a, (#_savedCheckFlag)
	sub	a, #0xa5
	jr	NZ, 00102$
	ld	a, (#_savedVersion)
;src/utils/leaderboard.c:21: DISABLE_RAM;
	dec	a
	jr	NZ, 00102$
	ld	(#_rRAMG),a
;src/utils/leaderboard.c:22: return;
	ret
00102$:
;src/utils/leaderboard.c:24: savedCheckFlag = SAVE_FLAG;
	ld	hl, #_savedCheckFlag
	ld	(hl), #0xa5
;src/utils/leaderboard.c:25: savedVersion = SAVE_VERSION;
	ld	hl, #_savedVersion
	ld	(hl), #0x01
;src/utils/leaderboard.c:26: for (i = 0; i < 3 * MAX_SCORES; i++)
	ld	c, #0x00
00105$:
;src/utils/leaderboard.c:27: savedScores[i] = 0;
	ld	hl, #_savedScores
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x00
;src/utils/leaderboard.c:26: for (i = 0; i < 3 * MAX_SCORES; i++)
	inc	c
	ld	a, c
	sub	a, #0x0f
	jr	C, 00105$
;src/utils/leaderboard.c:28: DISABLE_RAM;
	xor	a, a
	ld	(#_rRAMG),a
;src/utils/leaderboard.c:29: }
	ret
;src/utils/leaderboard.c:31: void save_score(uint8_t game_id, uint8_t score)
;	---------------------------------
; Function save_score
; ---------------------------------
_save_score::
	add	sp, #-8
	ld	c, a
	ldhl	sp,	#7
;src/utils/leaderboard.c:36: uint8_t score_offset = game_id * MAX_SCORES;
	ld	a, e
	ld	(hl-), a
	dec	hl
	ld	a, c
	add	a, a
	add	a, a
	add	a, c
	ld	(hl), a
;src/utils/leaderboard.c:38: load_scores(game_id, scores);
	ld	hl, #0
	add	hl, sp
	ld	e, l
	ld	d, h
	ld	a, c
	call	_load_scores
;src/utils/leaderboard.c:39: for (i = 0; i < MAX_SCORES; i++) {
	ldhl	sp,	#6
	ld	(hl), #0x00
	ld	c, #0x00
00110$:
;src/utils/leaderboard.c:40: if (score <= scores[i])
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	a, (hl)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	NC, 00104$
;src/utils/leaderboard.c:42: for (j = MAX_SCORES - 1; j > i; j--)
	ld	c, #0x04
00108$:
	ldhl	sp,	#6
	ld	a, (hl)
	sub	a, c
	jr	NC, 00103$
;src/utils/leaderboard.c:43: scores[j] = scores[j - 1];
	ld	e, c
	ld	d, #0x00
	ld	hl, #0
	add	hl, sp
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	dec	a
	ld	l, a
	rlca
	sbc	a, a
	ld	b, a
	push	de
	ld	e, l
	ld	d, b
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(de), a
;src/utils/leaderboard.c:42: for (j = MAX_SCORES - 1; j > i; j--)
	dec	c
	jr	00108$
00103$:
;src/utils/leaderboard.c:44: scores[i] = score;
	push	hl
	ld	hl, #2
	add	hl, sp
	ld	e, l
	ld	d, h
	pop	hl
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
;src/utils/leaderboard.c:45: break;
	jr	00105$
00104$:
;src/utils/leaderboard.c:39: for (i = 0; i < MAX_SCORES; i++) {
	inc	c
	ldhl	sp,	#6
	ld	(hl), c
	ld	a, c
	sub	a, #0x05
	jr	C, 00110$
00105$:
;src/utils/leaderboard.c:47: ENABLE_RAM;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;src/utils/leaderboard.c:48: savedCheckFlag = SAVE_FLAG;
	ld	hl, #_savedCheckFlag
	ld	(hl), #0xa5
;src/utils/leaderboard.c:49: savedVersion = SAVE_VERSION;
	ld	hl, #_savedVersion
	ld	(hl), #0x01
;src/utils/leaderboard.c:50: for (i = 0; i < MAX_SCORES; i++)
	ld	e, #0x00
00111$:
;src/utils/leaderboard.c:51: savedScores[score_offset + i] = scores[i];
	ldhl	sp,	#5
	ld	a, (hl)
	add	a, e
	add	a, #<(_savedScores)
	ld	c, a
	ld	a, #0x00
	adc	a, #>(_savedScores)
	ld	b, a
	push	de
	ld	d, #0x00
	ld	hl, #2
	add	hl, sp
	add	hl, de
	pop	de
	ld	a, (hl)
	ld	(bc), a
;src/utils/leaderboard.c:50: for (i = 0; i < MAX_SCORES; i++)
	inc	e
	ld	a, e
	sub	a, #0x05
	jr	C, 00111$
;src/utils/leaderboard.c:52: DISABLE_RAM;
	xor	a, a
	ld	(#_rRAMG),a
;src/utils/leaderboard.c:53: }
	add	sp, #8
	ret
;src/utils/leaderboard.c:55: void load_scores(uint8_t game_id, uint8_t *scores)
;	---------------------------------
; Function load_scores
; ---------------------------------
_load_scores::
	push	de
;src/utils/leaderboard.c:58: uint8_t score_offset = game_id * MAX_SCORES;
	ld	c, a
	add	a, a
	add	a, a
	add	a, c
	ld	c, a
;src/utils/leaderboard.c:60: ENABLE_RAM;
	ld	hl, #_rRAMG
	ld	(hl), #0x0a
;src/utils/leaderboard.c:61: if (savedCheckFlag == SAVE_FLAG) {
	ld	a, (#_savedCheckFlag)
;src/utils/leaderboard.c:62: for (i = 0; i < MAX_SCORES; i++)
	sub	a, #0xa5
	jr	NZ, 00115$
	ld	b, a
00106$:
;src/utils/leaderboard.c:63: scores[i] = savedScores[score_offset + i];
	pop	de
	push	de
	ld	l, b
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	add	a, b
	add	a, #<(_savedScores)
	ld	l, a
	ld	a, #0x00
	adc	a, #>(_savedScores)
	ld	h, a
	ld	a, (hl)
	ld	(de), a
;src/utils/leaderboard.c:62: for (i = 0; i < MAX_SCORES; i++)
	inc	b
	ld	a, b
	sub	a, #0x05
	jr	C, 00106$
	jr	00105$
;src/utils/leaderboard.c:65: for (i = 0; i < MAX_SCORES; i++)
00115$:
	ld	e, #0x00
00108$:
;src/utils/leaderboard.c:66: scores[i] = 0;
	push	de
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	xor	a, a
	ld	(bc), a
;src/utils/leaderboard.c:65: for (i = 0; i < MAX_SCORES; i++)
	inc	e
	ld	a, e
	sub	a, #0x05
	jr	C, 00108$
00105$:
;src/utils/leaderboard.c:68: DISABLE_RAM;
	xor	a, a
	ld	(#_rRAMG),a
;src/utils/leaderboard.c:69: }
	inc	sp
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
