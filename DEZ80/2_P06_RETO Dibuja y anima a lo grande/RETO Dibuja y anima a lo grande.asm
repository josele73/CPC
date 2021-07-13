org #4000
run #4000

;suelo
ld a,#50
ld hl,#c0a0
suelo:
ld (hl),#ff
ld  h,#c8
ld (hl),#a5
ld h,#d0
ld (hl),#5a
ld h,#d8
ld (hl),#ff
ld h,#c0
inc hl
dec a
jr nz,suelo


ld a,#14
ld hl,#c0a0
rojo:
ld (hl),#ff
ld  h,#c8
ld (hl),#00
ld h,#d0
ld (hl),#00
ld h,#d8
ld (hl),#ff
ld h,#c0
inc hl
inc hl
inc hl
inc hl
dec a
jr nz,rojo


;zona limpia entre suelo y techo

ld a,#50
ld hl,#c050
borrar:
ld (hl),#00
ld h,#c8
ld (hl),#00
ld h,#d0
ld (hl),#00
ld h,#d8
ld (hl),#00
ld h,#e0
ld (hl),#00
ld h,#e8
ld (hl),#00
ld h,#f0
ld (hl),#00
ld h,#f8
ld (hl),#00
ld h,#c0
inc hl
dec a
jp nz,borrar

;esta es la zona del techo

ld a,#50
ld hl,#c000
techo
ld (hl),#f0
ld h,#c8
ld (hl),#a5
ld h,#d0
ld (hl),#a5
ld h,#d8
ld (hl),#0f
ld h,#e0
ld (hl),#0a
ld h,#e8
ld (hl),#05
ld h,#e8
ld (hl),#08
ld h,#f0
ld (hl),#08
ld h,#f8
ld (hl),#00
ld h,#c0
inc hl
dec a
jp nz,techo



personaje:
 
ld hl,#8070
ld (#c050),hl

ld hl,#00d5
ld (#c850),hl

ld hl,#0877
ld (#d050),hl

ld hl,#7f05
ld (#d850),hl

ld hl,#0406
ld (#e050),hl

ld hl,#8070
ld (#e850),hl

ld hl,#8040
ld (#f050),hl

ld hl,#c060
ld (#f850),hl



ld a,18
ld hl,#c060
repetir:
call bicho1
inc hl
dec a 
jp nz,repetir


jr $
bicho1:

ld (hl),#70
ld h,#c8
ld (hl),#d5
ld h,#d0
ld (hl),#77
ld h,#d8
ld (hl),#05
ld h,#e0
ld (hl),#06
ld h,#e8
ld (hl),#70
ld h,#f0
ld (hl),#40
ld h,#f8
ld (hl),#c0
ld h,#c0
inc hl
ld (hl),#80
ld h,#c8
ld (hl),#00
ld h,#d0
ld (hl),#08
ld h,#d8
ld (hl),#7f
ld h,#e0
ld (hl),#04
ld h,#e8
ld (hl),#80
ld h,#f0
ld (hl),#80
ld h,#f8
ld (hl),#60
ld h,#c0
ret











