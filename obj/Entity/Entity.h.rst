ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .area _DATA
   4157                       2     entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
   41A7 08                    3     entity_data_size:       .db #8                  ;Cantidad de bytes por entity
   41A8 00                    4     entity_num:             .db #0                  ;Numero de entidades activas actualmente
                              5 
   41A9 00 00                 6     entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
   41AB 00 00                 7     entity_next_sprite:             .dw #0x0000     ;Direccion del sprite parametro a la hora de crear una entity
   41AD 00                    8     entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           
                              9 
                             10     
                             11 
                             12 .area _CODE
                             13 
                             14 
                             15 .globl entity_forall                                ;Para todas las entidades, haz algo
                             16 .globl entity_create                                ;Crea una entity
