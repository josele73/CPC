ORG #4000
RUN inicio


;;;; la vagoneta eempieza en la linea #C2330
;;;; el suelo esta en la linea #C280
;;;; los bariles empiezan en #C258
posicion: dw #c230
velocidad: db #a
velocidad2: db #14
velocidad3: db #1e

inicio:
call cls

ld hl,#c280
call suelo
ld hl,#c258
call barriles
ld hl,#c230
call espera_inicial

call vagoneta
ld hl,#c230
ld b,#49
call espera_inicial



bucle:
 
 ld hl,(posicion)
 call borrar_8x8
 inc hl
 ld (posicion),hl
 call vagoneta
 call espera
 ld a,47
 call #BB1E ;;
 jr nz, pulsada ; si tecla pulsada salta a pulsada
 dec b
 jr z,pulsada
;; No pulsada
 

jr continuar

pulsada:
 call frenazo
 ;jr $
 ret
  
  ;ld hl,(posicion)
  ;call borrar_8x8
  ;inc hl
  ;ld (posicion),hl
  ;call vagoneta
  ;call espera
  

  



continuar:
jr bucle


;;;;;;;;;;;;;;;
;;  RUTINAS  ;;
;;;;;;;;;;;;;;;


explosion1:
;parte izquierda
ld (hl), %10000000
ld h,#ca
ld (hl), %01110100
ld h,#d2
ld (hl), %01110010
ld h,#da
ld (hl), %01110001
ld h,#e2
ld (hl), %01110001
ld h,#ea
ld (hl), %01110010
ld h,#f2
ld (hl), %01110100
ld h,#fa
ld (hl), %10000000
;parte derecha
inc hl
ld h,#c2
ld (hl), %00010000
ld h,#ca
ld (hl), %11100010
ld h,#d2
ld (hl), %11100100
ld h,#da
ld (hl), %11101000
ld h,#e2
ld (hl), %11101000
ld h,#ea
ld (hl), %11100100
ld h,#f2
ld (hl), %11100010
ld h,#fa
ld (hl), %00010000
dec hl
ret

;;;;;;;;;;;;;;;;;;; frenazo ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
frenazo:
ld a,#14
freno:
halt
dec a
jr nz,freno
 ld hl,(posicion)
 call borrar_8x8
 inc hl
ld (posicion),hl
call vagoneta

ld a,#14
freno2:
halt
dec a
jr nz,freno2
 ld hl,(posicion)
 call borrar_8x8
 inc hl
ld (posicion),hl
call vagoneta

ld a,#1e
freno3:
halt
dec a
jr nz,freno3
 ld hl,(posicion)
 call borrar_8x8
 inc hl
ld (posicion),hl
call vagoneta

ld a,#2b
freno4:
halt
dec a
jr nz,freno4
 ld hl,(posicion)
 call borrar_8x8
 inc hl
ld (posicion),hl
call vagoneta

ld a,#32
freno5:
halt
dec a
jr nz,freno5
 ld hl,(posicion)
 call borrar_8x8
 inc hl
ld (posicion),hl
call vagoneta
jr $
ret

;;;;;;;;;;;;;;; fin frenazo ;;;;;;;;;;;;;;;;;;;

espera_inicial:
ld a,#384
repe:
halt
dec a
jr nz,repe
ret



espera:
ld a,(velocidad)
repe_i:
halt
dec a
jr nz,repe_i
reti


barriles:
;mostamos barriles
ld a,#14
repite_barril:
 call barril
 inc hl 
 inc hl
 dec a
 jr nz,repite_barril:
ret

;; barril
barril:
ld (hl), %10011001
ld h,#ca
ld (hl), %01101111
ld h,#d2
ld (hl), %10011111
ld h,#da
ld (hl), %11111111
ld h,#e2
ld (hl), %01101111
ld h,#ea
ld (hl), %10011111
ld h,#f2
ld (hl), %11110110
ld h,#fa
ld (hl), %01100000
ld h,#c2
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
dec hl
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
dec hl

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


;; limpia pantalla
cls:
ld HL, #c000
ld de, #c001
ld bc, #4002
ld (hl), #00
ldir
ret




;;; Comparacion 16 bits de HL y DE
;;  LD A, H
;;  CP D
;;  JR NZ, no_iguales
;;  LD A, L
;;  CP E
;;  JR NZ, no_iguales
;;iguales:
;;  ;;; (...)
 
;;no_iguales:
;;  ;;; (...)