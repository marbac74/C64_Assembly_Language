BasicUpstart2(main)

.label SCREEN_RAM = $0400
.label SCREEN_WIDTH = 40

Row_LO:
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 0))      // Row 0
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 1))      // Row 1
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 2))      // Row 2
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 3))      // Row 3
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 4))      // Row 4
.byte <(SCREEN_RAM + (SCREEN_WIDTH * 5))      // Row 5

Row_HI:
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 0))      // Row 0
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 1))      // Row 1
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 2))      // Row 2
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 3))      // Row 3
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 4))      // Row 4
.byte >(SCREEN_RAM + (SCREEN_WIDTH * 5))      // Row 5

main:
	ldx #0                                    // Row 0

rowloop:                                  
	lda Row_LO,x 
	sta $0020                                 // Low Byte in first Zero Page address

	lda Row_HI,x 
	sta $0021                                 // High Byte in second Zero Page address

	ldy #0                                    // Column 0

	lda #1                                    // A

store:
	sta ($0020),y                             // Store A at memory address contained in Zero Page
	                                          // addresses $0020 and $0021 with an offset contained
	                                          // in y register
	iny
	cpy #40
	bne store
	inx
	cpx #6
	bne rowloop
    rts