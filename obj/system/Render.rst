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
   4203                       9 PlayerSprite:
   4203 70 E0                10         .db     #0x70 , #0xe0 
   4205 33 CC                11         .db     #0x33 , #0xcc 
   4207 11 88                12         .db     #0x11 , #0x88 
   4209 F0 F0                13         .db     #0xF0 , #0xF0 
   420B A1 58                14         .db     #0xA1 , #0x58 
   420D A1 58                15         .db     #0xA1 , #0x58 
   420F AA 55                16         .db     #0xAA , #0x55 
   4211 22 44                17         .db     #0x22 , #0x44 
   4213 22 44                18         .db     #0x22 , #0x44 
   4215 06 60                19         .db     #0x06 , #0x60
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   4217                       3 render_init::
                              4     
   4217 C9            [10]    5 ret
                              6 
   4218                       7 render_one_entity:: ;En hl, la entity a renderizar
                              8     
                              9     
                             10     ;Comprobamos que la entity sea renderizable
   4218 7E            [ 7]   11     ld a, (hl)
   4219 E6 04         [ 7]   12     and a, #4 ;Componente Renderizable
   421B FE 00         [ 7]   13     cp #0
   421D 28 15         [12]   14     jr z, render_end
                             15 
                             16     ;Preparamos getScreenPtr
   421F 23            [ 6]   17     inc hl ;posX
   4220 4E            [ 7]   18     ld c, (hl)
   4221 23            [ 6]   19     inc hl ;posY
   4222 46            [ 7]   20     ld b, (hl)
                             21     
   4223 11 00 C0      [10]   22     ld de, #0xc000
   4226 CD 24 41      [17]   23     call cpct_getScreenPtr_asm
                             24 
                             25     ;Y ahora dibujar el sprite
   4229 EB            [ 4]   26     ex de, hl
   422A 21 03 42      [10]   27     ld hl, #PlayerSprite
   422D 0E 02         [ 7]   28     ld c, #2
   422F 06 0A         [ 7]   29     ld b, #10
   4231 CD 74 40      [17]   30     call cpct_drawSprite_asm
                             31     
                             32 
   4234                      33     render_end:
   4234 C9            [10]   34 ret
