; this waits until you press the start button

start_screen_wait:
    lda START_BUTTON 
    and INPUT_REG1
    cmp #00
    bne update_start

    lda START_BUTTON 
    and INPUT_REG2
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
    
    lda SELECT
    and INPUT_REG2
    cmp #00
    bne pause_state
    jmp check_unpause

    pause_state:
        lda #02
        sta UI_STATE
        ; jsr play_startup
    check_unpause:
        lda START_BUTTON 
        and INPUT_REG1
        cmp #00
        bne unpause_state
        
        lda START_BUTTON 
        and INPUT_REG2
        cmp #00
        bne unpause_state

        rts
        unpause_state:
            ; lazy i know t-t
            
            lda #$3f
            sta $2006
            lda #$00
            sta $2006

            lda #$0f
            sta $2007
            lda #01
            sta UI_STATE
            ; jsr play_startup
            rts
    

    

