BasicUpstart2(main)

main:
	lda #%11011000  // Set bit 4 (decimal 16)
	sta $d016       // Activate multicolor character mode

	jsr $e544       // KERNAL clear screen subroutine

	lda #12         // Medium Grey (shared)
	sta $d022
	
	lda #0          // Black (shared)
	sta $d023

	lda #8          // H
	sta $0400
	lda #13         // Green
	sta $d800

	lda #5          // E
	sta $0401
	lda #11         // Cyan
	sta $d801

	lda #12         // L (x2)
	sta $0402
	sta $0403
	lda #10         // Red
	sta $d802
	sta $d803

	lda #14         // O
	sta $0404
	lda #15         // Yellow
	sta $d804

    rts