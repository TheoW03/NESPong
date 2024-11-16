init_sprites:
        load_pallete:
            lda palletes,X 
            sta $2007
            inx 
            cpx #$20
            bne load_pallete
            lda #$00
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
        rts

go_ip:
    lda #$20
    ora $20
    cmp #$20
    sta $21
    beq end_of_this
    incr_x:
        ldx $0200
        inx
        stx $0200
        ldx $0204
        inx 
        stx $0204
        rts
        jmp end_of_this
    ldx $020c
    inx
    stx $020c
    ldx $0210
    inx 
    stx $0210
    end_of_this:
        rts
     

.include "./sprite_data.s"
