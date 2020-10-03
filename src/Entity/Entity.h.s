.area _DATA
    entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
    entity_data_size:       .db #8                  ;Cantidad de bytes por entity
    entity_num:             .db #0                  ;Numero de entidades activas actualmente

    entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
    entity_next_sprite:             .ds 2           ;Direccion del sprite parametro a la hora de crear una entity
    entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           

    


.area _CODE
.globl PlayerSprite
.globl entity_create_player