ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Entity.h.s"
                              1 .area _DATA
   41AE                       2     entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
   41FE 08                    3     entity_data_size:       .db #8                  ;Cantidad de bytes por entity
   41FF 00                    4     entity_num:             .db #0                  ;Numero de entidades activas actualmente
                              5 
   4200 00 00                 6     entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
   4202 00 00                 7     entity_next_sprite:             .dw #0x0000     ;Direccion del sprite parametro a la hora de crear una entity
   4204 00                    8     entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           
                              9 
                             10     
                             11 
                             12 .area _CODE
                             13 
                             14 
                             15 .globl entity_forall                                ;Para todas las entidades, haz algo
                             16 .globl entity_create                                ;Crea una entity
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   401E                       3 entity_create:: ; Parametros: d(componentes), c(posX), b(posY), e(tipo), (entity_next_sprite) (sprite)
                              4                 ; Con "tipo" quiero decir si es player, enemigo, bloque, etc
                              5                 ; Una especie de forma de saber que es cada cosa, por si acaso
                              6                 ; sirviera en un futuro, que no lo sé
                              7 
                              8     ;No generamos entidad si ya hay tantas como el maximo
   401E 3A FF 41      [13]    9     ld a, (entity_num)
   4021 FE 14         [ 7]   10     cp #0x14
   4023 28 24         [12]   11     jr z, entity_create_end
                             12 
                             13     ;Buscamos una entidad vacía. Sabemos que hay una porque no hemos llegado al maximo
   4025 21 AE 41      [10]   14     ld hl, #entity_array
   4028                      15     buscandoceros:
   4028 7E            [ 7]   16         ld a, (hl)
   4029 FE 00         [ 7]   17         cp #0
   402B 28 09         [12]   18         jr z, terminodebuscar
                             19 
                             20         ;Avanzamos a la siguiente
   402D 3A FE 41      [13]   21         ld a, (entity_data_size)
   4030                      22         createiterator:
   4030 23            [ 6]   23             inc hl
   4031 3D            [ 4]   24             dec a
   4032 20 FC         [12]   25         jr nz, createiterator
                             26 
   4034 18 F2         [12]   27     jr buscandoceros ; sin condicion, solo salimos de aqui a traves de terminodebuscar
                             28 
   4036                      29     terminodebuscar:
   4036 72            [ 7]   30     ld (hl), d ;Componentes
   4037 23            [ 6]   31     inc hl
   4038 71            [ 7]   32     ld (hl), c ; posX
   4039 23            [ 6]   33     inc hl 
   403A 70            [ 7]   34     ld (hl), b ;posY
   403B 23            [ 6]   35     inc hl
   403C 36 00         [10]   36     ld (hl), #0 ;velX
   403E 23            [ 6]   37     inc hl
   403F 36 00         [10]   38     ld (hl), #0 ;velY
   4041 23            [ 6]   39     inc hl
   4042 3A 02 42      [13]   40     ld a, (entity_next_sprite)
   4045 77            [ 7]   41     ld (hl), a ;Sprite
   4046 23            [ 6]   42     inc hl
   4047 23            [ 6]   43     inc hl
   4048 73            [ 7]   44     ld (hl), e ;tipo de entity
                             45 
                             46 
                             47 
   4049                      48     entity_create_end:
   4049 C9            [10]   49 ret
                             50 ; Componentes
                             51 ; PosX
                             52 ; PosY
                             53 ; Velocidad X
                             54 ; Velocidad Y
                             55 ; Sprite
                             56 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



                             57 
   404A                      58 entity_forall:: ; Parametros:   (hl) direccion de la funcion a llamar
   404A 22 00 42      [16]   59     ld (entity_function_being_called), hl
                             60 
                             61     ;empezamos en la primera
   404D 21 AE 41      [10]   62     ld hl, #entity_array
   4050 EB            [ 4]   63     ex de, hl
                             64 
   4051                      65     forallentities:
                             66         ;Primero hacemos la funcion sobre la primera
   4051 CD 00 42      [17]   67         call (entity_function_being_called)
                             68 
                             69         ;Avanzamos a la siguiente
   4054                      70         foralliterator:
   4054 3A FE 41      [13]   71             ld a, (entity_data_size)
   4057 2A 04 42      [16]   72             ld hl, (entity_iterator)
   405A 34            [11]   73             inc (hl)
   405B 3D            [ 4]   74             dec a
   405C 20 F6         [12]   75         jr nz, foralliterator
                             76 
                             77         ;Comprobamos si hemos terminado
   405E 3A FF 41      [13]   78         ld a, (entity_num)
   4061 4F            [ 4]   79         ld c, a
   4062 3A 04 42      [13]   80         ld a, (entity_iterator)
   4065 B9            [ 4]   81         cp c
   4066 20 E9         [12]   82     jr nz, forallentities
                             83 
   4068 C9            [10]   84 ret
                             85 
