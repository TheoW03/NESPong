; .define BUTTON_UP #$08
; .define BUTTON_DOWN #$04
; .define INPUT_REG1 $20
; .define INPUT_REG2 $21

; function designed to move the paddles

; handles paddle 1 controls
handle_paddle1_controls:

    ; sees what happens
    lda BUTTON_DOWN 
    and INPUT_REG1
    cmp #00
    bne incr_x
    lda #$00
    lda BUTTON_UP 
    and INPUT_REG1
    bne decr_x
    jmp end_of_this
    ; this runs the 1st paddle of $4016 
    incr_x:
        ldx $0200
        inx
        inx 
        stx $0200
        ldx $0204
        inx 
        inx 
        stx $0204
        rts
        jmp end_of_this
    decr_x:
        ldx $0200
        dex
        dex 
        stx $0200
        ldx $0204
        dex 
        dex 
        stx $0204
        rts
        jmp end_of_this
    

    ;  this handles the 2nd paddle

    ; ldx $020c
    ; inx
    ; stx $020c
    ; ldx $0210
    ; inx 
    ; stx $0210
    end_of_this:
        rts

; handles paddle 2 controls
handle_paddle2_controls:
    lda #$00
    lda BUTTON_DOWN 
    and INPUT_REG2
    cmp #00
    bne incr_x2
    lda #$00
    lda BUTTON_UP 
    and INPUT_REG2
    bne decr_x2
    jmp end_of_2
    incr_x2:
        ldx $020c
        inx
        inx
        stx $020c
        ldx $0210
        inx 
        inx
        stx $0210
        jmp end_of_2
    decr_x2:
        ldx $020c
        dex
        dex
        stx $020c
        ldx $0210
        dex
        dex 
        stx $0210
        jmp end_of_2
    end_of_2:
        rts
