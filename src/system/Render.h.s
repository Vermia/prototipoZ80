
.area _DATA
.globl render_one_entity
.globl render_init
.globl cpct_getScreenPtr_asm
.globl cpct_drawSprite_asm


PlayerSprite:
        .db     #0x70 , #0xe0 
        .db     #0x33 , #0xcc 
        .db     #0x11 , #0x88 
        .db     #0xF0 , #0xF0 
        .db     #0xA1 , #0x58 
        .db     #0xA1 , #0x58 
        .db     #0xAA , #0x55 
        .db     #0x22 , #0x44 
        .db     #0x22 , #0x44 
        .db     #0x06 , #0x60
