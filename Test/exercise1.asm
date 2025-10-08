BasicUpstart2(main)

main:
	lda #8         // H
	sta $0400
	lda #5         // E
	sta $0401
	lda #12        // L (x2)
	sta $0402
	sta $0403
	lda #15        // O
	sta $0404
	lda #32        // Space
	sta $0405
	lda #3         // C
	sta $0406
	lda #54        // 6
	sta $0407
	lda #52        // 4
	sta $0408
	rts