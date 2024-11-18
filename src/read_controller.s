
init_input:
    ; inits
    lda #1
    sta INPUT_REG1

    ; resets this is for input 1
    sta $4016
    lda #0
    sta $4016

    
    ; this resets the 2nd controller register
    lda #1
    sta INPUT_REG2

    ; resets this is for input 2
    sta $4017
    lda #0
    sta $4017
    rts


read_controller:

; stores the contents of the input register to $20 to be used. this is for 
; the left paddle
    read_loop1:
        lda $4016
        lsr a
        rol INPUT_REG1
        bcc read_loop1
    lda #0 

; stores the contents of the input register to $21 to be used. this is for 
; the right paddle
    read_loop2: 
        lda $4017
        lsr a
        rol INPUT_REG2
        bcc read_loop2
    rts
