.data
x:  .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
    .double 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

y:	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
    .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
   	.double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100

a:  .double 1    ;Escalar a

mask:      .byte 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
mask2:     .byte 0xff, 0xff, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00

.text
	LD    	F2,mask    
	MOVF2S 	VM,F2    	; Fijamos la máscara
    ADDI	R1,R0,x     ; R1 contiene la dirección de x
    ADDI   	R2,R0,y     ; R2 contiene la dirección de y
    LD     	F0, a(R0)   ; F0 escalar a
    ADDI   	R8,R0,32   	; Tamaño seccion normal
    MOVI2S  VLR,R8
    LV     	V0,0(R1)
    MULTSV  V1,F0,V0
    LV     	V2,0(R2)
    ADDV   	V3,V1,V2
    SV     	0(R2),V3
    ADDI   	R4,R1,1592  ; 200 elementos en bytes 
    ADDI    R1,R1,64   	; Siguiente sección de X 
    ADDI    R2,R2,64	; Siguiente sección de Y

inicio:   
    LD    	F4,mask2  
    MOVF2S  VM,F4    	; Fijamos la máscara  
    LV     	V0,0(R1)
    MULTSV  V1,F0,V0
    LV     	V2,0(R2)
    ADDV   	V3,V1,V2
    SV     	0(R2),V3
    ADDI    R1,R1,256   ; Siguiente sección de X 
    ADDI    R2,R2,256   ; Siguiente sección de Y 
    MOVI2S  VLR,R8;
    CVM        
    SGT 	R6,R1,R4 	; test por si finalizado
    BEQZ 	R6,inicio 	; bucle si no finalizado 
	NOP                 ; Hueco de retardo	
    TRAP 		6 		; Fin del programa
