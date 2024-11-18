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
        ldx PADDLE1_LOWER_SUBPIXEL_Y
        inx
        inx 
        stx PADDLE1_LOWER_SUBPIXEL_Y
        ldx PADDLE1_UPPER_SUBPIXEL_Y
        inx 
        inx 
        stx PADDLE1_UPPER_SUBPIXEL_Y
        rts
        jmp end_of_this
    decr_x:
        ldx PADDLE1_UPPER_SUBPIXEL_Y
        dex
        dex 
        stx PADDLE1_UPPER_SUBPIXEL_Y
        ldx PADDLE1_LOWER_SUBPIXEL_Y
        dex 
        dex 
        stx PADDLE1_LOWER_SUBPIXEL_Y
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
        ldx PADDLE2_UPPER_SUBPIXEL_Y
        inx
        inx
        stx PADDLE2_UPPER_SUBPIXEL_Y
        ldx PADDLE2_LOWER_SUBPIXEL_Y
        inx 
        inx
        stx PADDLE2_LOWER_SUBPIXEL_Y
        jmp end_of_2
    decr_x2:
        ldx PADDLE2_UPPER_SUBPIXEL_Y
        dex
        dex
        stx PADDLE2_UPPER_SUBPIXEL_Y
        ldx PADDLE2_LOWER_SUBPIXEL_Y
        dex
        dex 
        stx PADDLE2_LOWER_SUBPIXEL_Y
        jmp end_of_2
    end_of_2:
        rts
