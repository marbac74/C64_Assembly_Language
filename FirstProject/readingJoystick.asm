// Reading Joystick input and moving a sprite with Joystick Control
BasicUpstart2(main)

.label JOYSTICK2 = $dc00
.label JOYSTICK2_IDLE = %01111111

.label UP    = %00000001
.label DOWN  = %00000010
.label LEFT  = %00000100
.label RIGHT = %00001000
.label FIRE  = %00010000

.label SPRITE_X = $d000
.label SPRITE_Y = $d001
.label SPRITE_ENABLE = $d015
.label SPRITE_COLOR = $d027
.label SPRITE_POINTER = $07f8


main:
	lda #100
	sta SPRITE_X
	sta SPRITE_Y               // Setting the sprite's start position

	lda #$80
	sta SPRITE_POINTER         // Setting the sprite 0 pointer to RAM address $2000

	lda #WHITE
	sta SPRITE_COLOR

	lda #%00000001
	sta SPRITE_ENABLE          // Enabling sprite 0

gameLoop:
	jsr delay
	jsr readJoystick2
	jmp gameLoop

readJoystick2:
	lda JOYSTICK2
	cmp #JOYSTICK2_IDLE
	beq idle_joy2
	jmp checkJoy2_UP

	idle_joy2:

	checkJoy2_UP:
		lda JOYSTICK2
		and #UP
		beq joy2_UP
		jmp checkJoy2_DOWN
		joy2_UP:
			dec SPRITE_Y

	checkJoy2_DOWN:
		lda JOYSTICK2
		and #DOWN
		beq joy2_DOWN
		jmp checkJoy2_LEFT
		joy2_DOWN:
			inc SPRITE_Y

	checkJoy2_LEFT:
		lda JOYSTICK2
		and #LEFT
		beq joy2_LEFT 
		jmp checkJoy2_RIGHT
		joy2_LEFT:
			dec SPRITE_X

	checkJoy2_RIGHT:
		lda JOYSTICK2
		and #RIGHT
		beq joy2_RIGHT 
		jmp checkJoy2_FIRE
		joy2_RIGHT:
			inc SPRITE_X

	checkJoy2_FIRE:
		lda JOYSTICK2
		and #FIRE
		beq joy2_FIRE 
		jmp doneReadJoystick2
		joy2_FIRE:
			inc SPRITE_COLOR

doneReadJoystick2:
	rts

delay:
	ldx #250

	delayLoop1:
		ldy #100

		delayLoop2:
			iny
			bne delayLoop2

		inx
		bne delayLoop1

	rts 

*=$2000
.import binary "/sprites/hires_sprite.bin"