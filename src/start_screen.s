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
        rts