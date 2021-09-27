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

y:  .double 100, 100, 100, 100, 100, 100, 100, 100, 100, 100
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

a:  .double 2    ;Escalar a

    .text
main:	
	ADDI    R1,R0,x     ; R1 contiene la dirección de x
    ADDI    R2,R0,y     ; R2 contiene la dirección de y
    LD 		F0,a(R0)    ; F0 escalar a
    ADDI	R4,R1,1592  ; (Nº elementos*8)-8

inicio: LD 	F2,0(R1)    ; carga X(i)     
	MULTD   F4,F2,F0    ; multiplica a*X(i) 
	LD      F6,0(R2)    ; carga Y(i)      
	ADDD    F6,F4,F6    ; suma a*X(i)+Y(i)   
	SD      0(R2),F6    ; almacena Y(i)   
	ADDI    R1,R1,8     ; incrementa índice X   
	ADDI    R2,R2,8     ; incremente índice Y   
	SGT     R3,R1,R4    ; test por si finalizado   
	BEQZ    R3,inicio   ; bucle si no finalizado 
    NOP                 ; Hueco de retardo
    TRAP 6              ; Fin del programa
	    
