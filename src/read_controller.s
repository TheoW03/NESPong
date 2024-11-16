
init_input:
    ; inits
    lda #1
    sta $20

    ; resets
    sta $4016
    lda #0
    sta $4016
    rts

read_controllers:
    read_loop:
        lda $4016
        lsr a
        rol $20
        bcc read_loop
    rts

; check_

; change_x:
