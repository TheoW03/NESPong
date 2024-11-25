
check_collisons:
; checks the upper y sub pxiel on paddle1
; lda COLLISION_STATE_REG

; checks the upper y sub pxiel on paddle1

    lda PADDLE1_UPPER_SUBPIXEL_Y

    cmp BALL_Y
    
    beq check_X_sub
    bcc check_upper_pixel
    jmp paddle2_collides
    check_upper_pixel:
        lda PADDLE1_LOWER_SUBPIXEL_Y
        cmp BALL_Y
        bcs check_X_sub
        lda PADDLE1_LOWER_SUBPIXEL_Y
        cmp BALL_Y
        beq check_X_sub
        jmp paddle2_collides
        
    check_X_sub:
; cmp x  upper sub pixel paddle1  
        lda PADDLE1_UPPER_SUBPIXEL_X
        cmp BALL_X
        beq paddle1_collided
; cmp x lower sub pixel paddle1
        lda PADDLE1_LOWER_SUBPIXEL_X
        cmp BALL_X
        beq paddle1_collided

    paddle2_collides:
        lda PADDLE2_UPPER_SUBPIXEL_Y
        cmp BALL_Y
        bcc check_upper_sub_pixe2
        beq check_upper_sub_pixe2
        jmp end_of_collide
        check_upper_sub_pixe2:
            lda PADDLE2_LOWER_SUBPIXEL_Y
            cmp BALL_Y
            bpl check_X_sub2
            lda PADDLE2_LOWER_SUBPIXEL_Y
            cmp BALL_Y
            beq check_X_sub2
            jmp end_of_collide
    
    check_X_sub2:
; cmp upper x  sub pixel     
        lda PADDLE2_UPPER_SUBPIXEL_X
        cmp BALL_X
        beq paddle2_collided
; cmp lower x sub pixel
        lda PADDLE2_LOWER_SUBPIXEL_X
        cmp BALL_X
        beq paddle2_collided
        jmp end_of_collide
    paddle1_collided:
        lda #255
        sta BALL_VELOCITY_Y
        
        ldx #$01
        jsr play_hitsound

        stx COLLISION_STATE_REG
        jmp end_of_collide
    paddle2_collided:
        lda #1
        sta BALL_VELOCITY_Y
        ldx #255
        stx COLLISION_STATE_REG
        jsr play_hitsound
    end_of_collide:
        rts

court_bounds:
    lda #230
    cmp BALL_Y
    beq ball_hit_top
    
    lda #5
    cmp BALL_Y
    beq ball_hit_bottom
    rts
    ball_hit_top:
        lda #255
        sta BALL_VELOCITY_Y
        rts
    ball_hit_bottom:
        lda #1
        sta BALL_VELOCITY_Y
        rts
    
; updates the ball depending on the state located in $25
update_ball:  
      lda BALL_X
      clc
      adc BALL_VELOCITY_X
      sta BALL_X

      lda #0
      cmp DIVI_2
      beq incr_Y_vel
      rts
      incr_Y_vel:
        clc
        lda BALL_Y
        adc BALL_VELOCITY_Y
        sta BALL_Y
        rts
    

check_point:
    lda BALL_X
    cmp #$19
    bcc player1_point
    jmp check_player2_point
    player1_point:
        inc SCORE_1
        lda #00
        sta $32
        lda #0
        sta BALL_VELOCITY_Y
        jsr play_loser_sound
        ; inc
        ; sta SCORE_1
        rts
    check_player2_point:
        lda #$f1
        cmp BALL_X
        bcc player2_point
        rts
        player2_point:
            inc SCORE_2
            lda #00
            sta $32
            lda #0
            sta BALL_VELOCITY_Y
            jsr play_loser_sound
            ; inc
            ; sta SCORE_2
            rts

; this checks a winner 
check_winner:
    lda SCORE_1
    cmp #$3a
    beq player1_wins
    jmp player2_check
    player1_wins:
        lda #$3f
        sta $2006
        lda #$00
        sta $2006
        lda #$01
        sta $2007
        jsr player_wins
        rts
    player2_check:
        lda SCORE_2
        cmp #$3a
        beq player2_wins
        rts
        player2_wins:
            lda #$3f
            sta $2006
            lda #$00
            sta $2006
            lda #$05
            sta $2007

            jsr player_wins
            rts
player_wins:
    lda #0
    sta $32
    lda #$30
    sta SCORE_1
    sta SCORE_2
    lda #2
    sta UI_STATE
    rts
    
    
    

