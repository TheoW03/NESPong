.define BUTTON_A      $01   ; 0b00000001
.define BUTTON_B      $02   ; 0b00000010
.define BUTTON_SELECT $04   ; 0b00000100
.define BUTTON_START  $08   ; 0b00001000
.define BUTTON_UP     $10   ; 0b00010000
.define BUTTON_DOWN   $20   ; 0b00100000
.define BUTTON_LEFT   $40   ; 0b01000000
.define BUTTON_RIGHT  $80   ; 0b10000000
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
