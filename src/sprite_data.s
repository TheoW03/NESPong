palletes:
	.byte $00, $0F, $00, $10, 	$00, $0A, $15, $01, 	$00, $29, $28, $27, 	$00, $34, $24, $14 	;background palettes
	
	.byte $0f, $15, $11, $20, 	$0f, $11, $11, $30, 	$0f, $20, $30, $27, 	$00, $3C, $2C, $1C 	;sprite palettes
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
    .byte $50, $00, %00000000, $20 ; this is sub pixel one of paddle1
	.byte $58, $10, %00000000, $20 ; this is subp

ball:
	; this spawns the balll
	.byte $50, $01, %00000010, $70 

paddle2:
 	.byte $50, $00, %00000001, $f0 
	.byte $58, $10, %00000001, $f0

P:
 	.byte $50, $50, %00000010, $70 
O:
 	.byte $50, $4f, %00000010, $79 
N:
 	.byte $50, $4e, %00000010, $88 
G:
 	.byte $50, $47, %00000010, $91 


p:
 	.byte $60, $70, %00000010, $70 
r:
 	.byte $60, $72, %00000010, $79 
e:
 	.byte $60, $65, %00000010, $88 
s:
 	.byte $60, $73, %00000010, $91 
s2:
 	.byte $60, $73, %00000010, $97 

s3:
 	.byte $60, $73, %00000010, $a2 
t:
 	.byte $60, $74, %00000010, $a9 
a1:
 	.byte $60, $61, %00000010, $b0 
r2:
 	.byte $60, $72, %00000010, $b9 
t2:
 	.byte $60, $74, %00000010, $c1






