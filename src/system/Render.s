.include "Render.h.s"

render_init::
    
ret

render_one_entity:: ;En hl, la entity a renderizar
    
    
    ;Comprobamos que la entity sea renderizable
    ld a, (hl)
    and a, #4 ;Componente Renderizable
    cp #0
    jr z, render_end

    ;Preparamos getScreenPtr
    inc hl ;posX
    ld c, (hl)
    inc hl ;posY
    ld b, (hl)
    
    ld de, #0xc000
    call cpct_getScreenPtr_asm

    ;Y ahora dibujar el sprite
    ex de, hl
    ld hl, #PlayerSprite
    ld c, #2
    ld b, #10
    call cpct_drawSprite_asm
    

    render_end:
ret