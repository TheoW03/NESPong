; list of constants/mem addresses i may need


; NES button states in hexa descimal they are the ones I need exactly
.define BUTTON_UP #$08 
.define BUTTON_DOWN #$04
.define START_BUTTON #$10
.define SELECT   #$20

; memeory addresses of were input is stored 
; 20 is controller 1
; 21 is contrikker 2
.define INPUT_REG1 $20
.define INPUT_REG2 $21

; this is the satte for collisons
.define COLLISION_STATE_REG $25

.define BALL_VELOCITY_X $25
.define BALL_VELOCITY_Y $26
.define UI_STATE $30
.define DIVI_2 $27
.define SELECT_RESET $28
;essental memory addresses for sprites

.define PADDLE1_UPPER_SUBPIXEL_X $0203
.define PADDLE2_UPPER_SUBPIXEL_X $020f

.define PADDLE1_LOWER_SUBPIXEL_X $0207
.define PADDLE2_LOWER_SUBPIXEL_X $0213


.define PADDLE1_UPPER_SUBPIXEL_Y $0200
.define PADDLE2_UPPER_SUBPIXEL_Y $020c

.define PADDLE1_LOWER_SUBPIXEL_Y $0204 
.define PADDLE2_LOWER_SUBPIXEL_Y $0210

.define BALL_X $020b
.define BALL_Y $0208



.define SCORE_1 $38
.define SCORE_2 $39


wait_for_vblank:
    vblank_loop:
        bit $2002
        bpl vblank_loop
    rts

; random_num:
;     lda #32
;     sta RANDOM
;     rts