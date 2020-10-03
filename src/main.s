
.include "cpctelera.h.s"

.area _DATA


.area _CODE


.globl cpct_disableFirmware_asm
.globl render_init



main_init:
   call cpct_disableFirmware_asm
ret

_main::

   call main_init

   main_gameloop:

      

jr main_gameloop