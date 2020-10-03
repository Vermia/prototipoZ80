ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Entity.h.s"
                              1 .area _DATA
   408F                       2     entity_array:           .ds 80
   40DF 08                    3     entity_data_size:       .db #8
   40E0 00                    4     entity_num:             .db #0
                              5 
   40E1 00 00                 6     entity_function_being_called:   .dw #0x0000
   40E3 00                    7     entity_iterator:                .db 0
                              8 
                              9     
                             10 
                             11 .area _CODE
                             12 
                             13 
                             14 .globl entity_forall
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   4009                       3 entity_forall:: ; Parametros:   (hl) direccion de la funcion a llamar
   4009 22 E1 40      [16]    4     ld (entity_function_being_called), hl
                              5 
   400C 21 8F 40      [10]    6     ld hl, #entity_array
   400F EB            [ 4]    7     ex de, hl
                              8     
   4010                       9     forallentities:
   4010 CD E1 40      [17]   10         call (entity_function_being_called)
                             11 
   4013                      12         foralliterator:
   4013 3A DF 40      [13]   13             ld a, (entity_data_size)
   4016 2A E3 40      [16]   14             ld hl, (entity_iterator)
   4019 34            [11]   15             inc (hl)
   401A 3D            [ 4]   16             dec a
   401B 20 F6         [12]   17         jr nz, foralliterator
                             18 
   401D 3A E0 40      [13]   19         ld a, (entity_num)
   4020 4F            [ 4]   20         ld c, a
   4021 3A E3 40      [13]   21         ld a, (entity_iterator)
   4024 B9            [ 4]   22         cp c
   4025 20 E9         [12]   23     jr nz, forallentities
                             24 
   4027 C9            [10]   25 ret
                             26 
