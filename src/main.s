; sekelton if you want to add on to the tests


.segment "HEADER"
  ; .byte "NES", $1A      ; iNES header identifier
  .byte $4E, $45, $53, $1A
  .byte 2               ; 2x 16KB PRG code
  .byte 1               ; 1x  8KB CHR data
  .byte $01, $00        ; mapper 0, vertical mirroring
.segment "VECTORS"
  ;; When an NMI happens (once per frame if enabled) the label nmi:
    .addr nmi
    ;; When the processor first turns on or is reset, it will jump to the label reset:
    .addr reset ; reset vector
.segment "STARTUP"
.include "./util.s"

reset:
    sei
    cld

    ; reset sound
    ldx #%10000000
    stx $4017
    ldx #$00
    stx $4010

    ; init stack
    ldx #$FF
    TXS

    ; clear PPU registers
    LDX $00
    STX $2000
    STX $2001

    ;wait for vblank
    jsr wait_for_vblank
    ; vblank_loop:
    ;     bit $2002
    ;     bpl vblank_loop
    txa
    clear_mem:
        sta $0000, X
        sta $0100, X
        lda $FF
        sta $0200, X
        lda $00
        sta $0300, X
        sta $0400, X
        sta $0500, X
        sta $0600, X
        sta $0700, X
        inx 
        cpx #$00
        bne clear_mem
        lda #255
        sta $25
        jsr wait_for_vblank
        ; vblank_loop2:
        ;     bit $2002
        ;     bpl vblank_loop2
        
        lda #$02
        sta $4014
        nop

        ; store 3f00 in ppu
        lda #$3f
        sta $2006
        lda #$00
        sta $2006
        jsr init_sprites
        cli
        lda #%10010000 ; vblank status
        sta $2000
        lda #%00011110 ; vblank status
        sta $2001
        

    loop:
        jmp loop
nmi:
    lda $00
    cmp $32
    beq sprite_init
    bne sprites_alr_init
    sprite_init:
        
        jsr init_sprites
        jmp end
    sprites_alr_init:
        ; loads and gronds the input registers
        jsr init_input        
        ; stores the input in $20 and $21  
        jsr read_controller 

        ; applies this to the paddles
        jsr handle_paddle1_controls
        jsr handle_paddle2_controls
        
        ; update ball
        jsr check_collisons
        jsr update_ball
        jmp end
    end:
    lda #$02
    sta $4014
    rti   

.include "./load_sprites.s"
.include "./read_controller.s"
.include "./character_controller.s"
.include "./ball_logic.s"

; .include "./sprite_data.s"
.segment "CHARS" ; for graphics
.incbin  "./assets/sprites.chr"

