; https://irkenkitties.com/blog/2015/03/29/creating-sound-on-the-nes/

; this audio plays when hit
play_hitsound:
    lda #%10011111
    sta $4001

    lda #%11111101
    sta $4002

    lda #%11111000
    sta $4003
    rts

; start up soind
play_startup:
    lda #%10011001
    sta $4001

    lda #%11111001
    sta $4002

    lda #%11101010
    sta $4003
    rts
; start up soind
play_loser_sound:
    lda #%10011011
    sta $4001

    lda #%11011011
    sta $4002

    lda #%11101111
    sta $4003

    
    rts
