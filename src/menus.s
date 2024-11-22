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
    lda SELECT 
    and INPUT_REG1
    cmp #00
    bne pause_state
    beq check_unpause
    pause_state:
        lda #02
        sta UI_STATE
        ; jsr play_startup
        rts
    check_unpause:
        lda START_BUTTON 
        and INPUT_REG1
        cmp #00
        bne unpause_state
        rts
        unpause_state:
            lda #01
            sta UI_STATE
            ; jsr play_startup
            rts
    

    

