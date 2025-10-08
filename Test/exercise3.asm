BasicUpstart2(main)

main:
	lda #%11011000  // Set bit 4 (decimal 16)
	sta $d016       // Activate multicolor character mode

	lda #1          // A
	sta $0400       
	lda #2          // B
	sta $0401       
	lda #3          // C
	sta $0402

	lda #1          // Hi-Res White
	sta $d800       
	sta $d801
	sta $d802

	rts