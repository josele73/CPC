LD HL, #F3CF 		;FFF ROJO
LD (#C000), HL		; CARGA EN MEMORIA VIDEO
LD A,#C3
LD (#C002),A
;JR #400B