ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 
                              2 .area _DATA
                              3 .globl render_one_entity
                              4 .globl render_init
                              5 .globl cpct_getScreenPtr_asm
                              6 .globl cpct_drawSprite_asm
                              7 
                              8 
   41F8                       9 PlayerSprite:
   41F8 70 E0                10         .db     #0x70 , #0xe0 
   41FA 33 CC                11         .db     #0x33 , #0xcc 
   41FC 11 88                12         .db     #0x11 , #0x88 
   41FE F0 F0                13         .db     #0xF0 , #0xF0 
   4200 A1 58                14         .db     #0xA1 , #0x58 
   4202 A1 58                15         .db     #0xA1 , #0x58 
   4204 AA 55                16         .db     #0xAA , #0x55 
   4206 22 44                17         .db     #0x22 , #0x44 
   4208 22 44                18         .db     #0x22 , #0x44 
   420A 06 60                19         .db     #0x06 , #0x60
