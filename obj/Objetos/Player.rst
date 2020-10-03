ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Player.h.s"
                              1 
                              2 .area _DATA
                              3     
   423F                       4 PlayerSprite::
   423F 70 E0                 5         .db     #0x70 , #0xe0 
   4241 33 CC                 6         .db     #0x33 , #0xcc 
   4243 11 88                 7         .db     #0x11 , #0x88 
   4245 F0 F0                 8         .db     #0xF0 , #0xF0 
   4247 A1 58                 9         .db     #0xA1 , #0x58 
   4249 A1 58                10         .db     #0xA1 , #0x58 
   424B AA 55                11         .db     #0xAA , #0x55 
   424D 22 44                12         .db     #0x22 , #0x44 
   424F 22 44                13         .db     #0x22 , #0x44 
   4251 06 60                14         .db     #0x06 , #0x60
                             15 
                             16 
                             17 
                             18 
                             19 .area _CODE
                             20 
