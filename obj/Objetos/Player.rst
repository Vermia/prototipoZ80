ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Player.h.s"
                              1 
                              2 .area _DATA
                              3     
   4249                       4 PlayerSprite:
   4249 70 E0                 5         .db     #0x70 , #0xe0 
   424B 33 CC                 6         .db     #0x33 , #0xcc 
   424D 11 88                 7         .db     #0x11 , #0x88 
   424F F0 F0                 8         .db     #0xF0 , #0xF0 
   4251 A1 58                 9         .db     #0xA1 , #0x58 
   4253 A1 58                10         .db     #0xA1 , #0x58 
   4255 AA 55                11         .db     #0xAA , #0x55 
   4257 22 44                12         .db     #0x22 , #0x44 
   4259 22 44                13         .db     #0x22 , #0x44 
   425B 06 60                14         .db     #0x06 , #0x60
                             15 
                             16 
                             17 
                             18 
                             19 .area _CODE
                             20 
