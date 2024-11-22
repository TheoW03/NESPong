palletes:
	.byte $00, $0F, $00, $10, 	$00, $0A, $15, $01, 	$00, $29, $28, $27, 	$00, $34, $24, $14 	;background palettes
	
	.byte $0f, $11, $15, $30, 	$0f, $15, $11, $30, 	$0f, $20, $30, $27, 	$00, $3C, $2C, $1C 	;sprite palettes
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
    .byte $50, $00, $00, $20 ; this is sub pixel one of paddle1
	.byte $58, $10, $00, $20 ; this is subp

ball:
	; this spawns the balll
	.byte $50, $01, %00000010, $70 

paddle2:
 	.byte $50, $00, %00000001, $f0 
	.byte $58, $10, %00000001, $f0


