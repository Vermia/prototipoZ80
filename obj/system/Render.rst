ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Render.h.s"
                              1 
                              2 
                              3 .globl render_one_entity
                              4 .globl render_init
                              5 ;.globl cpct_getScreenPtr_asm
                              6 
                              7 
                              8 
                              9 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   4069                       3 render_init::
                              4     
   4069 C9            [10]    5 ret
                              6 
   406A                       7 render_one_entity::
                              8     
                              9     
                             10     ;Comprobamos que la entity sea renderizable
   406A 7E            [ 7]   11     ld a, (hl)
   406B E6 04         [ 7]   12     and a, #4 ;Componente Renderizable
   406D FE 00         [ 7]   13     cp #0
   406F 28 04         [12]   14     jr z, render_end
                             15 
                             16     ;Preparamos getScreenPtr
   4071 23            [ 6]   17     inc hl ;posX
   4072 4E            [ 7]   18     ld c, (hl)
   4073 23            [ 6]   19     inc hl ;posY
   4074 46            [ 7]   20     ld b, (hl)
                             21     
                             22     
                             23 
   4075                      24     render_end:
   4075 C9            [10]   25 ret
