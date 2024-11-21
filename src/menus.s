; this waits until you press the start button

start_screen_wait:
    lda START_BUTTON 
    and INPUT_REG1
    cmp #00
    bne update_start
    rts
    update_start:
        lda #1
        sta UI_STATE
        jsr play_startup 
        rts

pause_game:
    lda INPUT_REG1
    cmp #00
    beq end_of_pause
    lda SELECT 
    and INPUT_REG1
    cmp #00
    bne pause_state
     jmp end_of_pause
    pause_state:
        lda UI_STATE
        cmp #2
        beq unpause
        
        lda UI_STATE
        cmp #1
        beq pause
        pause:
            lda #2
            sta UI_STATE
            rts
        unpause:
            lda #1
            sta UI_STATE
            rts
    end_of_pause:
        rts

