.include "Entity.h.s"

entity_forall:: ; Parametros:   (hl) direccion de la funcion a llamar
    ld (entity_function_being_called), hl

    ;empezamos en la primera
    ld hl, #entity_array
    ex de, hl

    forallentities:
        ;Primero hacemos la funcion sobre la primera
        call (entity_function_being_called)

        ;Avanzamos a la siguiente
        foralliterator:
            ld a, (entity_data_size)
            ld hl, (entity_iterator)
            inc (hl)
            dec a
        jr nz, foralliterator

        ;Comprobamos si hemos terminado
        ld a, (entity_num)
        ld c, a
        ld a, (entity_iterator)
        cp c
    jr nz, forallentities

ret

