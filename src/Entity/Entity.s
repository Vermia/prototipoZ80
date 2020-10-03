.include "Entity.h.s"

entity_create:: ; Parametros: d(componentes), c(posX), b(posY), e(tipo), (entity_next_sprite) (sprite)
                ; Con "tipo" quiero decir si es player, enemigo, bloque, etc
                ; Una especie de forma de saber que es cada cosa, por si acaso
                ; sirviera en un futuro, que no lo sé

    ;No generamos entidad si ya hay tantas como el maximo
    ld a, (entity_num)
    cp #0x14
    jr z, entity_create_end

    ;Buscamos una entidad vacía. Sabemos que hay una porque no hemos llegado al maximo
    ld hl, #entity_array
    buscandoceros:
        ld a, (hl)
        cp #0
        jr z, terminodebuscar

        ;Avanzamos a la siguiente
        ld a, (entity_data_size)
        createiterator:
            inc hl
            dec a
        jr nz, createiterator

    jr buscandoceros ; sin condicion, solo salimos de aqui a traves de terminodebuscar

    terminodebuscar:
    ld (hl), d ;Componentes
    inc hl
    ld (hl), c ; posX
    inc hl 
    ld (hl), b ;posY
    inc hl
    ld (hl), #0 ;velX
    inc hl
    ld (hl), #0 ;velY
    inc hl
    ld (hl), (entity_next_sprite) ;Sprite
    inc hl
    inc hl
    ld (hl), e ;tipo de entity



    entity_create_end:
ret
; Componentes
; PosX
; PosY
; Velocidad X
; Velocidad Y
; Sprite


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

