

check_collisons:
; checks the upper y sub pxiel on paddle1
; lda COLLISION_STATE_REG
    lda $0200
    cmp $0208
; checks the bottom y sub pxiel on paddle1
    beq check_X_sub
    lda $0204
    cmp $0208
    beq check_X_sub
; if no collisons check paddle 2 collsions
    jmp paddle2_collides
    check_X_sub:
; cmp x  upper sub pixel paddle1  
        lda $0203
        cmp $020b
        beq paddle1_collided
; cmp x lower sub pixel paddle1
        lda $0207
        cmp $020b
        beq paddle1_collided

    paddle2_collides:
; cmp y upper sub pixel
        lda $020c
        cmp $0208
        beq check_X_sub2
; cmp y lower sub pixel
        lda $0210
        cmp $0208
        beq check_X_sub2
        jmp end_of_collide
    check_X_sub2:
; cmp upper x  sub pixel     
        lda $020f
        cmp $020b
        beq paddle2_collided
; cmp lower x sub pixel
        lda $0213
        cmp $020b
        beq paddle2_collided
        jmp end_of_collide
    paddle1_collided:
        ldx #$01
        stx COLLISION_STATE_REG
        jmp end_of_collide
    paddle2_collided:
        ldx #$00
        stx COLLISION_STATE_REG
    end_of_collide:
        rts

; updates the ball depending on the state located in $25
update_ball:
      lda COLLISION_STATE_REG
      cmp #$01
      bne ball_left ; goes ball right if equal
      ball_right:
          ldx $020b
          inx
          stx $020b
          jmp end_of_ball_up
      ball_left:
          ldx $020b
          dex
          stx $020b
      end_of_ball_up:
          rts

