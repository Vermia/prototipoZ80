ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .area _DATA
   4141                       2     entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
   4191 08                    3     entity_data_size:       .db #8                  ;Cantidad de bytes por entity
   4192 00                    4     entity_num:             .db #0                  ;Numero de entidades activas actualmente
                              5 
   4193 00 00                 6     entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
   4195                       7     entity_next_sprite:             .ds 2           ;Direccion del sprite parametro a la hora de crear una entity
   4197 00                    8     entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           
                              9 
                             10     
                             11 
                             12 
                             13 .area _CODE
                             14 .globl PlayerSprite
                             15 .globl entity_create_player
