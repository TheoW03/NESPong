
check_collisons:
; checks the upper y sub pxiel on paddle1
; lda COLLISION_STATE_REG

; checks the upper y sub pxiel on paddle1

    lda PADDLE1_UPPER_SUBPIXEL_Y
    cmp BALL_Y

    beq check_X_sub
; checks the bottom y sub pxiel on paddle1  + 1
    
    lda PADDLE1_UPPER_SUBPIXEL_Y
    clc 
    adc #01
    cmp BALL_Y
    beq check_X_sub

    lda PADDLE1_UPPER_SUBPIXEL_Y
    clc
    adc #02
    cmp BALL_Y
    beq check_X_sub
    
    lda PADDLE1_LOWER_SUBPIXEL_Y
    cmp BALL_Y

    lda PADDLE1_LOWER_SUBPIXEL_Y
    clc 
    sbc #01
    cmp BALL_Y
    beq check_X_sub
    
    
    lda PADDLE1_LOWER_SUBPIXEL_Y
    clc 
    sbc #02
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
; cmp y upper sub pixel
        lda PADDLE2_UPPER_SUBPIXEL_Y
        cmp BALL_Y
        beq check_X_sub2
; cmp y lower sub pixel
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
        ; lda BALL_VELOCITY_Y 
        ;  #$01
        ldx #$01
        jsr play_hitsound

        ; lda #%10011111
        ; sta $4001

        ; lda #%11111101
        ; sta $4002

        ; lda #%11111000
        ; sta $4003
        stx COLLISION_STATE_REG
        jmp end_of_collide
    paddle2_collided:
        lda #1
        sta BALL_VELOCITY_Y
        ldx #255
        jsr play_hitsound
        stx COLLISION_STATE_REG
    end_of_collide:
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
    

      
