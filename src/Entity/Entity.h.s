.area _DATA
    entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
    entity_data_size:       .db #8                  ;Cantidad de bytes por entity
    entity_num:             .db #0                  ;Numero de entidades activas actualmente

    entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
    entity_next_sprite              .dw #0x0000     ;Direccion del sprite parametro a la hora de crear una entity
    entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           

    

.area _CODE


.globl entity_forall                                ;Para todas las entidades, haz algo
.globl entity_create                                ;Crea una entity