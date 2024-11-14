wait_for_vblank:
    vblank_loop:
        bit $2002
        bpl vblank_loop
    rts