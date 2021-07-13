org #4000
run #4000

;limpiamos pantalla
call cls
;direcion incio y repeticion suelo
ld hl,#c280
call suelo
; direccion inicio y carga vagoneta

;ld hl,#c230
;call vagoneta
bucle
;comropbar si esta puslsado

ld a,64
call #BB1E
jr nz, pulsada1 ; si tecla pulsada salta a pulsada


ld a,65
call #BB1E
jr nz, pulsada2 ; si tecla pulsada salta a pulsada



ld a,57
call #BB1E
jr nz, pulsada3 ; si tecla pulsada salta a pulsada


ld a,56
call #BB1E
jr nz, pulsada4 ; si tecla pulsada salta a pulsada


ld a,49
call #BB1E
jr nz, pulsada5 ; si tecla pulsada salta a pulsada

;; No pulsada
jr bucle


;;;;;;;;;;;;;;;
;;  RUTINAS  ;;
;;;;;;;;;;;;;;;

pulsada1:

  ld hl,#c230
  call vagoneta
  ret
 

pulsada2:

  ld hl,#c235
  call vagoneta
  ret

pulsada3:

  ld hl,#c240
  call vagoneta
  ret

pulsada4:

  ld hl,#c245
  call vagoneta
  ret

pulsada5:

  ld hl,#c250
  call vagoneta
  ret






vagoneta:
;parte izquierda
ld (hl), %10001000
ld h,#ca
ld (hl), %11111100
ld h,#d2
ld (hl), %11111110
ld h,#da
ld (hl), %11111111
ld h,#e2
ld (hl), %10111011
ld h,#ea
ld (hl), %00010101
ld h,#f2
ld (hl), %00001110
ld h,#fa
ld (hl), %00000100
;parte derecha
inc hl
ld h,#c2
ld (hl), %00010001
ld h,#ca
ld (hl), %11110011
ld h,#d2
ld (hl), %11110111
ld h,#da
ld (hl), %11111111
ld h,#e2
ld (hl), %11011101
ld h,#ea
ld (hl), %10001010
ld h,#f2
ld (hl), %00000111
ld h,#fa
ld (hl), %00000010

ret

borrar_8x8:
;parte izquierda
ld (hl), #00
ld h,#ca
ld (hl), #00
ld h,#d2
ld (hl), #00
ld h,#da
ld (hl), #00
ld h,#e2
ld (hl), #00
ld h,#ea
ld (hl), #00
ld h,#f2
ld (hl), #00
ld h,#fa
ld (hl), #00
;parte derecha
inc hl
ld h,#c2
ld (hl), #00
ld h,#ca
ld (hl), #00
ld h,#d2
ld (hl), #00
ld h,#da
ld (hl), #00
ld h,#e2
ld (hl), #00
ld h,#ea
ld (hl), #00
ld h,#f2
ld (hl), #00
ld h,#fa
ld (hl), #00
ret

;Dibujamos suelo
suelo:
;repetimos 50 veces
ld a,#50
 repetir_suelo:
 ld (hl), %00001010
 ld h,#CA
 ld (hl), %01000000
 ld h,#D2
 ld (hl), %01100000
 ld h,#DA
 ld (hl), %01010000
 ld h,#C2
 ;aumentamos HL
 inc hl
 ;vamos quitando a
 dec a
 ;si a es 0 acabamos sino repetimos suelo
 jr nz,repetir_suelo
ret


cls:
ld HL, #c000
ld de, #c001
ld bc, #4002
ld (hl), #00
ldir
ret