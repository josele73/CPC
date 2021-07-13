org #4000
run #4000

;limpiamos pantalla
call cls
;direcion incio y repeticion suelo
ld hl,#c280
call suelo
; direccion inicio y carga vagoneta

ld hl,#c230
call vagoneta
bucle
;comropbar si esta puslsado

ld a,47
call #BB1E
jr nz, pulsada ; si tecla pulsada salta a pulsada

;; No pulsada
jr continuar

pulsada:

  ;ld hl,#c230
  call borrar_8x8
  call correr
  ret

continuar:
jr bucle

;;;;;;;;;;;;;;;
;;  RUTINAS  ;;
;;;;;;;;;;;;;;;


correr:
ld hl,#c230
call borrar_8x8


ld b,#A
repe:

inc hl

call vagoneta
call espera1
dec hl
call borrar_8x8
dec b
jr nz,repe
call vagoneta
ld b,#A
dec hl
call borrar_8x8
repe2:

inc hl

call vagoneta
call espera2
dec hl
call borrar_8x8
dec b
jr nz,repe2
call vagoneta

ld b,#5
dec hl
call borrar_8x8
repe3:

inc hl
call vagoneta
call espera3
dec hl
call borrar_8x8
dec b
jr nz,repe3
call vagoneta
jr $


espera1:
ld a,#F
esp
halt
dec a
jr nz,esp
ret

espera2:
ld a,#1e
esp2
halt
dec a
jr nz,esp2
ret

espera3:
ld a,#2d
esp3
halt
dec a
jr nz,esp3
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