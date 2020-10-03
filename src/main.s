
.include "cpctelera.h.s"
;.include "Objetos/Player.h.s"

.area _DATA

.globl cpct_disableFirmware_asm
.globl cpct_getScreenPtr_asm
.globl render_init
.globl cpct_drawSprite_asm
;.globl entity_create
;.globl entity_forall
.globl render_one_entity
.globl entity_create_player
.globl PlayerSprite
.globl entity_array



.area _CODE


main_init:
   
ret

_main::
   call cpct_disableFirmware_asm
   call entity_create_player

   main_gameloop:
      ld hl, #entity_array
      call render_one_entity

      ;ld hl, #render_one_entity
      ;call entity_forall

jr main_gameloop