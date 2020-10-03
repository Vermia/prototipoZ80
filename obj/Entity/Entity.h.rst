ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .area _DATA
                              2 ;.globl entity_array
   414A                       3     entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
   419A 08                    4     entity_data_size:       .db #8                  ;Cantidad de bytes por entity
   419B 00                    5     entity_num:             .db #0                  ;Numero de entidades activas actualmente
                              6 
   419C 00 00                 7     entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
   419E                       8     entity_next_sprite:             .ds 2           ;Direccion del sprite parametro a la hora de crear una entity
   41A0 00                    9     entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           
                             10 
                             11     
                             12 
                             13 
                             14 .area _CODE
                             15 .globl PlayerSprite
                             16 .globl entity_create_player
