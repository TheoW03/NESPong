
init_input1:
    ; inits
    lda #1
    sta $20

    ; resets
    sta $4016
    lda #0
    sta $4016
    rts

init_input2:
    ; inits
    lda #1
    sta $21

    ; resets
    sta $4017
    lda #0
    sta $4017
    rts

read_controller1:
    read_loop:
        lda $4016
        lsr a
        rol $20
        bcc read_loop
    rts

read_controller2:
    read_loop2:
        lda $4017
        lsr a
        rol $21
        bcc read_loop2
    rts
; check_

; change_x:
