BasicUpstart2(main)

main:
	changeColor()
	jmp main

.macro changeColor () {

	inc $d020
				
}