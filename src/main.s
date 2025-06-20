; this is the main file
;
; =======sources===============
; the NES font sprites:  https://forums.nesdev.org/viewtopic.php?t=10284
; Random number algorithm: https://www.nesdev.org/wiki/Random_number_generator
; code for input: https://www.youtube.com/watch?v=nAStgQzPrAQ&t=1s&ab_channel=NesHacker
; sprites and sound were created by me :]
;===============================
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

    ldx #%00000011 ; enables the sound
    stx $4015

    ; init stack
    ldx #$FF
    txs

    ; clear PPU registers
    ldx #$00
    stx $2000
    stx $2001

    ;wait for vblank
    jsr wait_for_vblank
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
        jsr play_startup 

        lda #$3f
        sta $2006
        lda #$00
        sta $2006
        jsr init_pallets
        ; jsr init_sprites
        ldx #00
        stx UI_STATE
        ldx #$30
        stx SCORE_1
        stx SCORE_2
        cli
        lda #%10010000 ; vblank status
        sta $2000
        lda #%00011110 ; enable renderering
        sta $2001
        lda #87
        sta seed
        

    loop:
        jmp loop
nmi:
    ; jsr prng
    lda #0
    cmp UI_STATE
    beq start_screen
    bne game_play
    jmp end
    start_screen:
          
        jsr init_pallets
        jsr init_title
        ; loads and gronds the input registers
        jsr init_input        
        ; stores the input in $20 and $21  
        jsr read_controller 
        jsr start_screen_wait
        jmp end
    game_play:
        jsr prng

        lda #$00
        cmp $32
        beq sprite_init
        bne sprites_alr_init

        sprite_init:
            
            jsr init_pallets
            jsr init_sprites
            
            jmp end
        sprites_alr_init:
            
           
            ; loads and gronds the input registers
            ; stores the input in $20 and $21  
            jsr init_input
            jsr read_controller 
            jsr pause_game

            lda UI_STATE
            cmp #2
            bne play_game
            jmp end
            play_game:
                jsr init_input
                jsr read_controller 
                ; applies this to the paddles
                jsr handle_paddle1_controls
                jsr handle_paddle2_controls
        
                ; update l
                jsr check_collisons
                jsr update_ball
                jsr check_point
                jsr court_bounds
                jsr check_winner
                inc DIVI_2
                lda DIVI_2
                cmp DIVI_3
                beq isNotEven
                jmp end
                isNotEven:
                    lda #0
                    sta DIVI_2
                ; lda DIVI_2
                ; cmp DIVI_3

                ; lda #0
                ; cmp DIVI_2
                ; beq is_even
                ; bne isNotEven
                ; is_even:
                ;     lda #1
                ;     sta DIVI_2
                ;     jmp end
                
                end:
                    lda #$02
                    sta $4014
                    rti   
 
.include "./load_sprites.s"
.include "./read_controller.s"
.include "./character_controller.s"
.include "./ball_logic.s"
.include "./audio.s"
.include "./menus.s"


; source for font 
; https://forums.nesdev.org/viewtopic.php?t=10284

.segment "CHARS"
.incbin  "./assets/ascii.chr"
; .segment "CHARS1"
; .incbin  "./assets/ascii.chr"
