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
        clc
        lda PADDLE1_LOWER_SUBPIXEL_Y
        adc #$02
        sta PADDLE1_LOWER_SUBPIXEL_Y

        lda PADDLE1_UPPER_SUBPIXEL_Y
        clc
        adc #$02 
        sta PADDLE1_UPPER_SUBPIXEL_Y
        jmp end_of_this
    decr_x:
        clc
        lda PADDLE1_UPPER_SUBPIXEL_Y 
        sbc #$02 
        sta PADDLE1_UPPER_SUBPIXEL_Y
        lda PADDLE1_LOWER_SUBPIXEL_Y
        clc
        sbc #$02 
        sta PADDLE1_LOWER_SUBPIXEL_Y
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
        clc
        lda PADDLE2_UPPER_SUBPIXEL_Y
        adc #$02
        sta PADDLE2_UPPER_SUBPIXEL_Y
        lda PADDLE2_LOWER_SUBPIXEL_Y
        clc
        adc #$02
        sta PADDLE2_LOWER_SUBPIXEL_Y
        jmp end_of_2
    decr_x2:
        clc
        lda PADDLE2_LOWER_SUBPIXEL_Y
        sbc #$02
        sta PADDLE2_LOWER_SUBPIXEL_Y
        clc
        lda PADDLE2_UPPER_SUBPIXEL_Y
        sbc #$02
        sta PADDLE2_UPPER_SUBPIXEL_Y
    end_of_2:
        rts
