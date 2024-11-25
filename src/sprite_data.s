palletes:
	.byte $00, $0F, $00, $10, 	$00, $0A, $15, $01, 	$00, $29, $28, $27, 	$00, $34, $24, $14 	;background palettes
	
	.byte $0f, $20, $15, $20, 	$0f, $11, $11, $30, 	$0f, $20, $30, $27, 	$00, $3C, $2C, $1C 	;sprite palettes
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
	.byte $50, $01, %00000000, $70 

paddle2:
 	.byte $50, $00, %00000001, $f0 
	.byte $58, $10, %00000001, $f0
score:
	.byte $10, $30, %00000000, $f5
score2:
	.byte $10, $30, %00000000, $10




; this is the start menu

P:
 	.byte $50, $50, %00000010, $70 
O:
 	.byte $50, $4f, %00000010, $79 
N:
 	.byte $50, $4e, %00000010, $81 
G:
 	.byte $50, $47, %00000010, $89 


p:
 	.byte $b0, $70, %00000010, $60 
r:
 	.byte $b0, $72, %00000010, $69 
e:
 	.byte $b0, $65, %00000010, $70 
s:
 	.byte $b0, $73, %00000010, $78 
s2:
 	.byte $b0, $73, %00000010, $80 

s3:
 	.byte $b0, $73, %00000010, $90 
t:
 	.byte $b0, $74, %00000010, $97 
a1:
 	.byte $b0, $61, %00000010, $a0 
r2:
 	.byte $b0, $72, %00000010, $a9 
t2:
 	.byte $b0, $74, %00000010, $b1






