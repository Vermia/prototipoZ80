
.include "cpctelera.h.s"
;.include "Objetos/Player.h.s"

.area _DATA
PlayerSprite:
        .db     #0x33 , #0xCC 
        .db     #0x77 , #0xEE 
        .db     #0x11 , #0x88 
        .db     #0xF0 , #0xF0 
        .db     #0xBB , #0xDD 
        .db     #0xBB , #0xDD 
        .db     #0x0A , #0x55 
        .db     #0x22 , #0x44 
        .db     #0x22 , #0x44 
        .db     #0x66 , #0x66 

.globl cpct_disableFirmware_asm
.globl cpct_getScreenPtr_asm
.globl render_init
.globl cpct_drawSprite_asm

.area _CODE


main_init:
   call cpct_disableFirmware_asm
ret

_main::

   call main_init

   main_gameloop:

      ld de, #0xc000
      ld c,  #39
      ld b,  #100
    call cpct_getScreenPtr_asm

    ex de, hl
    ld hl, #PlayerSprite
    ld c, #2
    ld b, #10
    call cpct_drawSprite_asm


jr main_gameloop