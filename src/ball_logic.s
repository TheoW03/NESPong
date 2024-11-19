
check_collisons:
; checks the upper y sub pxiel on paddle1
; lda COLLISION_STATE_REG
    lda PADDLE1_UPPER_SUBPIXEL_Y
    cmp BALL_Y
; checks the bottom y sub pxiel on paddle1
    beq check_X_sub
    lda PADDLE1_LOWER_SUBPIXEL_Y
    cmp BALL_Y
    beq check_X_sub
; if no collisons check paddle 2 collsions
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
        ldx #$01
        stx COLLISION_STATE_REG
        jmp end_of_collide
    paddle2_collided:
        ldx #255
        stx COLLISION_STATE_REG
    end_of_collide:
        rts

; updates the ball depending on the state located in $25
update_ball:  
      lda BALL_X
      clc
      adc COLLISION_STATE_REG
      sta BALL_X
      rts
