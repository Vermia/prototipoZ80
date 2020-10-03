ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .area _DATA
   403A                       2     entity_array:           .ds 80
   408A 08                    3     entity_data_size:       .db #8
   408B 00                    4     entity_num:             .db #0
                              5 
   408C 00 00                 6     entity_function_being_called:   .dw #0x0000
   408E 00                    7     entity_iterator:                .db 0
                              8 
                              9     
                             10 
                             11 .area _CODE
                             12 
                             13 
                             14 .globl entity_forall
