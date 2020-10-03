
.include "cpctelera.h.s"
;.include "Entity/Entity.h.s"
;.include "Objetos/Player.h.s"

.area _DATA

.globl cpct_disableFirmware_asm
.globl cpct_getScreenPtr_asm
.globl render_init
.globl cpct_drawSprite_asm
;.globl entity_create
;.globl entity_forall
;.globl entity_array
.globl entity_forfirst
.globl render_one_entity
.globl entity_create_player
.globl PlayerSprite




.area _CODE


main_init:
   
ret

_main::
   call cpct_disableFirmware_asm
   call entity_create_player

   main_gameloop:

      ld hl, #render_one_entity
      ;call entity_forall
      call entity_forfirst

jr main_gameloop