BasicUpstart2(main)

main:
	lda #1          // A
	sta $0400   
	sta $0403
	lda #2          // B
	sta $0401
	sta $0402

	lda #7          // Yellow
	sta $d800
	sta $d802
	lda #5          // Green
	sta $d801
	sta $d803
	rts