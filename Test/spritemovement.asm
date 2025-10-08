BasicUpstart2(main)

main:
	ldx #0
	lda #255
patternLoop:
	sta $2000,x
	inx
	cpx #64
	bne patternLoop

	lda #100       // X&Y start positions
	sta $d000      // for Sprite 0
	sta $d001      
	lda #$80       // Setting Sprite pointer to memory location
	sta $07f8
	lda #%00000001 // Enable Sprite 0
	sta $d015

gameLoop:
	inc $d000      // Move Sprite 0 one pixel right
	jmp gameLoop