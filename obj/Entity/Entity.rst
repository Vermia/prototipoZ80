ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 1.
Hexadecimal [16-Bits]



                              1 .include "Entity.h.s"
                              1 .area _DATA
                              2 .globl entity_array 
                              3 
   4198                       4     entity_array:           .ds 80                  ;Direccion donde estan guardadas las entities
   41E8 08                    5     entity_data_size:       .db #8                  ;Cantidad de bytes por entity
   41E9 00                    6     entity_num:             .db #0                  ;Numero de entidades activas actualmente
                              7 
   41EA 00 00                 8     entity_function_being_called:   .dw #0x0000     ;Funcion a la que estamos llamando en forall
   41EC                       9     entity_next_sprite:             .ds 2           ;Direccion del sprite parametro a la hora de crear una entity
   41EE 00                   10     entity_iterator:                .db #0          ;Ni cuando puse esto sabia para que valia           
                             11 
                             12     
                             13 
                             14 
                             15 .area _CODE
                             16 .globl PlayerSprite
                             17 .globl entity_create_player
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 2.
Hexadecimal [16-Bits]



                              2 
   400F                       3 entity_create_player:
   400F 21 35 42      [10]    4     ld hl, #PlayerSprite
   4012 22 EC 41      [16]    5     ld (entity_next_sprite), hl
   4015 16 04         [ 7]    6     ld d, #4
   4017 1E 01         [ 7]    7     ld e, #1
   4019 0E 27         [ 7]    8     ld c, #39
   401B 06 64         [ 7]    9     ld b, #100
   401D CD 21 40      [17]   10     call entity_create
   4020 C9            [10]   11 ret
                             12 
   4021                      13 entity_create:: ; Parametros: d(componentes), c(posX), b(posY), e(tipo), (entity_next_sprite) (sprite)
                             14                 ; Con "tipo" quiero decir si es player, enemigo, bloque, etc
                             15                 ; Una especie de forma de saber que es cada cosa, por si acaso
                             16                 ; sirviera en un futuro, que no lo sé
                             17 
                             18     ;No generamos entidad si ya hay tantas como el maximo
   4021 3A E9 41      [13]   19     ld a, (entity_num)
   4024 FE 14         [ 7]   20     cp #0x14
   4026 28 2A         [12]   21     jr z, entity_create_end
                             22 
                             23     ;Buscamos una entidad vacía. Sabemos que hay una porque no hemos llegado al maximo
   4028 21 98 41      [10]   24     ld hl, #entity_array
   402B                      25     buscandoceros:
   402B 7E            [ 7]   26         ld a, (hl)
   402C FE 00         [ 7]   27         cp #0
   402E 28 09         [12]   28         jr z, terminodebuscar
                             29 
                             30         ;Avanzamos a la siguiente
   4030 3A E8 41      [13]   31         ld a, (entity_data_size)
   4033                      32         createiterator:
   4033 23            [ 6]   33             inc hl
   4034 3D            [ 4]   34             dec a
   4035 20 FC         [12]   35         jr nz, createiterator
                             36 
   4037 18 F2         [12]   37     jr buscandoceros ; sin condicion, solo salimos de aqui a traves de terminodebuscar
                             38 
   4039                      39     terminodebuscar:
   4039 72            [ 7]   40     ld (hl), d ;Componentes
   403A 23            [ 6]   41     inc hl
   403B 71            [ 7]   42     ld (hl), c ; posX
   403C 23            [ 6]   43     inc hl 
   403D 70            [ 7]   44     ld (hl), b ;posY
   403E 23            [ 6]   45     inc hl
   403F 36 00         [10]   46     ld (hl), #0 ;velX
   4041 23            [ 6]   47     inc hl
   4042 36 00         [10]   48     ld (hl), #0 ;velY
   4044 23            [ 6]   49     inc hl
   4045 ED 4B EC 41   [20]   50     ld bc, (entity_next_sprite)
   4049 71            [ 7]   51     ld (hl), c ;Sprite
   404A 23            [ 6]   52     inc hl
   404B 70            [ 7]   53     ld (hl), b
   404C 23            [ 6]   54     inc hl
   404D 73            [ 7]   55     ld (hl), e ;tipo de entity
                             56 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (Zilog Z80 / Hitachi HD64180), page 3.
Hexadecimal [16-Bits]



   404E 21 E9 41      [10]   57     ld hl, #entity_num
   4051 34            [11]   58     inc (hl)
                             59 
   4052                      60     entity_create_end:
   4052 C9            [10]   61 ret
                             62 ; Componentes
                             63 ; PosX
                             64 ; PosY
                             65 ; Velocidad X
                             66 ; Velocidad Y
                             67 ; Sprite
                             68 
                             69 
   4053                      70 entity_forall:: ; Parametros:   (hl) direccion de la funcion a llamar
   4053 22 EA 41      [16]   71     ld (entity_function_being_called), hl
                             72 
                             73     ;empezamos en la primera
   4056 21 98 41      [10]   74     ld hl, #entity_array
   4059 EB            [ 4]   75     ex de, hl
                             76 
   405A                      77     forallentities:
                             78         ;Primero hacemos la funcion sobre la primera
   405A CD EA 41      [17]   79         call (entity_function_being_called)
                             80 
                             81         ;Avanzamos a la siguiente
   405D                      82         foralliterator:
   405D 3A E8 41      [13]   83             ld a, (entity_data_size)
   4060 21 EE 41      [10]   84             ld hl, #entity_iterator
   4063 34            [11]   85             inc (hl)
   4064 EB            [ 4]   86             ex de, hl
   4065 23            [ 6]   87             inc hl
   4066 3D            [ 4]   88             dec a
   4067 20 F4         [12]   89         jr nz, foralliterator
                             90 
                             91         ;Comprobamos si hemos terminado
   4069 3A E9 41      [13]   92         ld a, (entity_num)
   406C 4F            [ 4]   93         ld c, a
   406D 3A EE 41      [13]   94         ld a, (entity_iterator)
   4070 B9            [ 4]   95         cp c
   4071 20 E7         [12]   96     jr nz, forallentities
                             97 
   4073 C9            [10]   98 ret
                             99 
