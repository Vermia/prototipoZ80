ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Render.h.s"
                              1 
                              2 .area _DATA
                              3 .globl render_one_entity
                              4 .globl render_init
                              5 .globl cpct_getScreenPtr_asm
                              6 .globl cpct_drawSprite_asm
                              7 
                              8 
   420C                       9 PlayerSprite:
   420C 70 E0                10         .db     #0x70 , #0xe0 
   420E 33 CC                11         .db     #0x33 , #0xcc 
   4210 11 88                12         .db     #0x11 , #0x88 
   4212 F0 F0                13         .db     #0xF0 , #0xF0 
   4214 A1 58                14         .db     #0xA1 , #0x58 
   4216 A1 58                15         .db     #0xA1 , #0x58 
   4218 AA 55                16         .db     #0xAA , #0x55 
   421A 22 44                17         .db     #0x22 , #0x44 
   421C 22 44                18         .db     #0x22 , #0x44 
   421E 06 60                19         .db     #0x06 , #0x60
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   4220                       3 render_init::
                              4     
   4220 C9            [10]    5 ret
                              6 
   4221                       7 render_one_entity:: ;En de, la entity a renderizar
   4221 EB            [ 4]    8     ex de, hl
                              9     
                             10     ;Comprobamos que la entity sea renderizable
   4222 7E            [ 7]   11     ld a, (hl)
   4223 E6 04         [ 7]   12     and a, #4 ;Componente Renderizable
   4225 FE 00         [ 7]   13     cp #0
   4227 28 15         [12]   14     jr z, render_end
                             15 
                             16     ;Preparamos getScreenPtr
   4229 23            [ 6]   17     inc hl ;posX
   422A 4E            [ 7]   18     ld c, (hl)
   422B 23            [ 6]   19     inc hl ;posY
   422C 46            [ 7]   20     ld b, (hl)
                             21     
   422D 11 00 C0      [10]   22     ld de, #0xc000
   4230 CD 2D 41      [17]   23     call cpct_getScreenPtr_asm
                             24 
                             25     ;Y ahora dibujar el sprite
   4233 EB            [ 4]   26     ex de, hl
   4234 21 0C 42      [10]   27     ld hl, #PlayerSprite
   4237 0E 02         [ 7]   28     ld c, #2
   4239 06 0A         [ 7]   29     ld b, #10
   423B CD 7D 40      [17]   30     call cpct_drawSprite_asm
                             31     
                             32 
   423E                      33     render_end:
   423E C9            [10]   34 ret
