; .define BUTTON_UP #$08
; .define BUTTON_DOWN #$04
; .define INPUT_REG $20

init_pallets:
    load_pallete:
            lda palletes,X 
            sta $2007
            inx 
            cpx #$20
            bne load_pallete
        lda #$00
        ldx #$00
        rts
init_title:
        ldx #$00

    initP:
            lda P, X
            sta $0200, X
            inx
            cpx #$04
            bne initP
        
        ldx #$00
         initO:
            lda O, X
            sta $0204, X
            inx
            cpx #$04
            bne initO
            ldx #$00
        initN:
            lda N, X
            sta $0208, X
            inx
            cpx #$04
            bne initN
            ldx #$00
        
        initG:
            lda G, X
            sta $020C, X
            inx
            cpx #$04
            bne initG
            ldx #$00
        initp:
            lda p, X
            sta $0210, X
            inx
            cpx #$04
            bne initp
            ldx #$00
        initr:
            lda r, X
            sta $0214, X
            inx
            cpx #$04
            bne initr
            ldx #$00
        inite:
            lda e, X
            sta $0218, X
            inx
            cpx #$04
            bne inite
            ldx #$00
        inits:
            lda s, X
            sta $021c, X
            inx
            cpx #$04
            bne inits
            ldx #$00
        inits1:
            lda s2, X
            sta $0220, X
            inx
            cpx #$04
            bne inits1
            ldx #$00
        inits3:
            lda s3, X
            sta $0224, X
            inx
            cpx #$04
            bne inits3
            ldx #$00
         initt:
            lda t, X
            sta $0228, X
            inx
            cpx #$04
            bne initt
            ldx #$00
         inita:
            lda a1, X
            sta $022c, X
            inx
            cpx #$04
            bne inita
            ldx #$00
         initsr:
            lda r2, X
            sta $0230, X
            inx
            cpx #$04
            bne initsr
            ldx #$00
        initst:
            lda t2, X
            sta $0234, X
            inx
            cpx #$04
            bne initst
            ldx #$00
        rts
init_sprites:
        ldx #00
        reset_mem:
            lda $FF
            sta $0200, X
            inx
            cpx #$00
            bne reset_mem
            ldx #00
            lda #00
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
.include "./sprite_data.s"
