; .define BUTTON_UP #$08
; .define BUTTON_DOWN #$04
; .define INPUT_REG $20
init_sprites:
        load_pallete:
            lda palletes,X 
            sta $2007
            inx 
            cpx #$20
            bne load_pallete
            lda #$00
            ldx #$00
        load_paddle1:
            lda paddle1, X
            sta $0200, X
            inx
            cpx #$08
            bne load_paddle1
            ldx #$00
        load_ball:
            lda ball, X
            sta $0208, X
            inx
            cpx #$04 
            bne load_ball
            ldx #$00
        load_paddle2:
            lda paddle2, X
            sta $020c, X
            inx
            cpx #$08 
            bne load_paddle2
        lda #$01
        sta $32 ; verificationm this method works 
        rts

update_ball:
; cmp y  sub pixel     
; jmp collison_code
        lda $0200
        cmp $0208
        beq check_X_sub

; cmp y sub pixel
        lda $0204
        cmp $0208
        beq check_X_sub
        jmp paddle2_collides
        check_X_sub:
; cmp x  sub pixel     
        lda $0203
        cmp $020b
        beq paddle1_collided
; cmp x sub pixel
        lda $0207
        cmp $020b
        beq paddle1_collided
paddle2_collides:
; paddle2
        lda $020c
        cmp $0208
        beq check_X_sub2
; cmp y sub pixel
        lda $0210
        cmp $0208
        beq check_X_sub2
        check_X_sub2:
; cmp x  sub pixel     
        lda $020f
        cmp $020b
        beq padle2_colldied
; cmp x sub pixel
        lda $0213
        cmp $020b
        beq padle2_colldied

        ; ldx $00 
        ; stx $25
        
        jmp collison_code
        
        ; cmp $ 
        paddle1_collided:
            ldx #$01
            stx $25
            jmp collison_code
        padle2_colldied:
            ldx #$00
            stx $25
        collison_code:
            ; lda #$01
            ; sta $25
            lda $25
            cmp #$01
            bne ball_left
            beq ball_right
            ball_right:
                ldx $020b
                inx
                stx $020b
                jmp end_of_ball_up
            ball_left:
                ldx $020b
                dex
                stx $020b
                jmp end_of_ball_up
        ; lda $0204
        ; cmp 
        ; ldx $020b
        ; inx
        ; stx $020b
    end_of_ball_up:
        rts

; read_inp:
;     lda BUTTON_DOWN 
;     and INPUT_REG
;     cmp #00
;     sta $21
;     bne incr_x
;     lda #$00
;     lda BUTTON_UP 
;     and INPUT_REG
;     bne decr_x
;     jmp end_of_this

;     incr_x:
;         ldx $0200
;         inx
;         inx 
;         stx $0200
;         ldx $0204
;         inx 
;         inx 
;         stx $0204
;         rts
;         jmp end_of_this
;     decr_x:
;         ldx $0200
;         dex
;         dex 
;         stx $0200
;         ldx $0204
;         dex 
;         dex 
;         stx $0204
;         rts
;         jmp end_of_this
    
;     ldx $020c
;     inx
;     stx $020c
;     ldx $0210
;     inx 
;     stx $0210
;     end_of_this:
;         rts

.include "./sprite_data.s"
