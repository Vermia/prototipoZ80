.include "Render.h.s"

render_init::
    
ret

render_one_entity::
    
    
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
    
    

    render_end:
ret