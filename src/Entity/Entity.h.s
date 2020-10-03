.area _DATA
    entity_array:           .ds 80
    entity_data_size:       .db #8
    entity_num:             .db #0

    entity_function_being_called:   .dw #0x0000
    entity_iterator:                .db 0

    

.area _CODE


.globl entity_forall