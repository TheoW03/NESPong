palletes:
	.byte $00, $0F, $00, $10, 	$00, $0A, $15, $01, 	$00, $29, $28, $27, 	$00, $34, $24, $14 	;background palettes
	.byte $0f, $20, $15, $30, 	$00, $0F, $11, $30, 	$00, $0F, $30, $27, 	$00, $3C, $2C, $1C 	;sprite palettes
	; .byte $0F, $0F, $00, $10
	; .byte $00, $0F, $00, $10
	
paddle1:
;Y, SPRITE NUM, attributes, X
;76543210
;||||||||
;||||||++- Palette (4 to 7) of sprite
;|||+++--- Unimplemented
;||+------ Priority (0: in front of background; 1: behind background)
;|+------- Flip sprite horizontally
;+-------- Flip sprite vertically
    .byte $50, $00, $00, $20 ; this spawns a mushroom
	.byte $58, $10, $00, $20

	ball:
	; this spawns the balll
   	 .byte $50, $01, $00, $70 ; this spawns a mushroom

paddle2:
 	.byte $50, $00, $00, $A2 ; this spawns a mushroom
	.byte $58, $10, $00, $A2