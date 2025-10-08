BasicUpstart2(main)

main:
	lda #%00011110    // Set the bits to tell the VIC-II where the charset is
	sta $d018         // Screen memory setup

	lda #%11011000
	sta $d016         // Set bit 4 to enter screen in multicolor mode

	lda #71
	sta $0400
	lda #72
	sta $0401
	lda #87
	sta $0428
	lda #88
	sta $0429

	lda #15           // Multicolor Yellow
	sta $d800
	sta $d801
	sta $d828
	sta $d829

	lda #0            // Multicolor Black
	sta $d021         // Background color

	lda #8            // Orange
	sta $d022         // Extra color 1
	lda #9            // Brown
	sta $d023         // Extra color 2

	rts

*=$3800
.import binary "custom1.bin"