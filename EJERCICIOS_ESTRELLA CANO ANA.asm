        
        ;PRACTICA 7.2
        ;ESTRELLA CANO ANA GUADALUPE  
        
        .MODEL SMALL
        .DATA
            cadena1 db '[1] OPERACIONES ARITMETICAS$'
            cadena2 db '[2] NUMERO MAYOR$'
            CADENA3 DB '[3] MULTIPLICACION$'
            CADENA4 DB '[4] HIPOTENUSA$'  
            CADENA5 DB 'MENU DE OPERACIONES$'
            
            LINEA1 DB 'RESULTADO ES: $'
            LINEA2 DB '$'
            LINEA3 DB 'LA HIPOTENUSA ES:$' 
            LINEA4 DB 'RESTA ES: $'
              ;13 , 10, NEW Y TAB
            OPE1 DB '[1]SUMA$'
            OPE2 DB '[2]RESTA$'
            OPE3 DB '[3]MULTIPLICACION$'
            OPE4 DB '[4]DIVISION$'
            
            LINEA5 DB 'PARA SALIR PRESIONE: ESPACIO$'
            ;VARIABLES DE LAS OPERACIONES ARITMETICAS
            
             msj1 db 'Numero 1: ','$'
             msj2 db 'Numero 2: ','$'
             
             linea db 13,10,'$'
              var1 db 0
              var2 db 0  
             var3 db ?
   var4 db ?
   msg1 db '++ El primero es mayor++ $'
   msg2 db '++ El primero es menor++$'
   msg3 db '++ Son iguales++$'
   msg4 db '++ Primero valor++ $'
   msg5 db '++ Segundo valor++ $'
            
            
      .CODE
                    
            mov ax, @DATA
            mov ds, ax
            
            
          ;funcion 06h, int 10h: recorre la pantalla
          ;hacia arriba
          ;ah= funcion 06h
          ;al=00h para la pantalla completa
          ;bh=atributo de color fondo/texto
          ;cx=fila,columna iniciales
          ;dx=fila, columna finales
          
          mov ah, 06h
          mov al, 0    
          mov bh, 9fh
          mov cx, 0000d
          mov dx, 184fh
          int 10h
          
          mov ah, 06h
          mov al, 0    
          mov bh, 2fh
          mov cx, 0608h
          mov dx, 1447h
          int 10h
          
          MOV AH, 06H
          MOV AL, 0
          MOV BH, 1AH
          MOV CX, 0108H ;FILA
          MOV DX, 0247H ;COLUMNA
          INT 10H 
          
          ;funcion 02h, int 10h: establece posicion del cursor
            ;ah= funcion 02h
            ;bh= numero de pantalla
            ;dh  fila     solo hay de 0-24 filas
            ;dl= columna  solo hay de 0-79 columnas
             
             
             ;POSICION
            mov ah, 02h
            mov bh, 0
            mov dh, 02h
            mov dl, 21h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset cadena5
            int 21h 
            
            ;posicion
            mov ah, 02h
            mov bh, 0
            mov dh, 0ah
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset cadena1
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 0
            mov dh, 0bh
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset cadena2
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 0
            mov dh, 0ch
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset cadena3
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 0
            mov dh, 0dh
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset cadena4
            int 21h
             ;SOLICIT UN DATO
            MOV AH, 0H
            INT 16H          
            ;SWITCH
          ;aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa  
            CMP AL, "1"
            JE opc1
            CMP AL, "2"
            JE opc2
            
          
            ;CREA ETIQUETAS
           
            opc1:
            ;CREAR PANTALLA 2        
            MOV AH, 05H
            MOV AL, 1
            INT 10H
            
            
           MOV AH, 06H
          MOV AL, 1
          MOV BH, 1AH
          MOV CX, 0108H ;FILA
          MOV DX, 0247H ;COLUMNA
          INT 10H 
          
          ;funcion 02h, int 10h: establece posicion del cursor
            ;ah= funcion 02h
            ;bh= numero de pantalla
            ;dh  fila     solo hay de 0-24 filas
            ;dl= columna  solo hay de 0-79 columnas
             
             
             ;POSICION
            mov ah, 02h
            mov bh, 1
            mov dh, 02h
            mov dl, 21h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset cadena5
            int 21h 
            
            ;posicion
            mov ah, 02h
            mov bh, 1
            mov dh, 0ah
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset OPE1
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 1
            mov dh, 0bh
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset OPE2
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 1
            mov dh, 0ch
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset OPE3
            int 21h
            
             ;posicion
            mov ah, 02h
            mov bh, 1
            mov dh, 0dh
            mov dl, 30d
            int 10h 
            ;impresion
            mov ah, 09h 
            mov dx, offset OPE4
            int 21h
             ;SOLICIT UN DATO
            MOV AH, 0H
            INT 16H          
                   
            ;--------------------
            CMP AL, "1"
            JE SUMA
            CMP AL, "2"
            JE RESTA
            CMP AL, "3"
            JE MULTIPLICACION   
            CMP AL, "4"
            JE DIVISION
            
            
            
            
            ;CREA ETIQUETAS
            
            SUMA:
            ;CREAR PANTALLA 2
            
            MOV AH, 05H
            MOV AL,  2
            INT 10H
           
            
            
                 
           ;EMPIEZA CODIGO PARA REALIZAR SUMA
           
            call limpia 
            
            
            mov ah, 02h
            mov bh, 2
            mov dh, 08D
            mov dl, 12D
            int 10h 
              ;IMPRECION
                   
            
    mov ah,09h
    lea dx, msj1 ;desplegar numero 1:
    int 21h
    
    call leer ;lee primer numero
    sub al,30h ;restar 30h para obtener el numero
    mov var1,al ;lo guardo en var1 
    
            
            mov ah, 02h
            mov bh, 2
            mov dh, 09D
            mov dl, 12D
            int 10h
    
    mov ah,09h
    lea dx, msj2 ;desplegar numero 2:
    int 21h
    
    call leer ;lee segundo numero
    sub al,30h ;restar 30h para obtener segundo valor
    mov var2,al ;guardar en var2
    mov bl,var2 ;mover a bl
    
    ;******************* SUMA
    add bl,var1 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
    
     mov ah, 02h
            mov bh, 2
            mov dh, 17D
            mov dl, 13D
            int 10h
    mov ah,09h
    lea dx,LINEA1 ;imprimir suma
    int 21h
    mov dl,bl ;pongo en dl el numero a imprimir var2(bl)
    add dl,30h ; agrego 30h para obtener el caracter    
    mov ah,02h ;imprime un caracter
    int 21h
            
            
            
             ;POSICIONA EL CURSOR 
              mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5;ESPACIO PARA SALIR
            int 21h
           
            MOV AH, 0H
            INT 16H
            
           ;qqqqqqqqqqqqqqqqqqqqqqq
           ;REGRESA AL MENU 
            CMP AL, 032
            JE REGRESAR
            
            RESTA:
           
            ;CREAR PANTALLA 2
            
            MOV AH, 05H
            MOV AL, 2
            INT 10H    
            
               
            
            
            ;IMPRIMIR RESULTADO
                 ;POSICIONA EL CURSOR
             mov ah, 02h
            mov bh, 2
            mov dh, 12D
            mov dl, 21h
            int 10h 
            
             
            
            ;-------------EMPIEZA CODIGO DE RESTA
                 
             
                 call limpia 
            
            
            mov ah, 02h
            mov bh, 2
            mov dh, 08D
            mov dl, 12D
            int 10h 
              ;IMPRECION
                   
            
    mov ah,09h
    lea dx, msj1 ;desplegar numero 1:
    int 21h
    
    call leer ;lee primer numero
    sub al,30h ;restar 30h para obtener el numero
    mov var1,al ;lo guardo en var1 
    
            
            mov ah, 02h
            mov bh, 2
            mov dh, 09D
            mov dl, 12D
            int 10h
    
    mov ah,09h
    lea dx, msj2 ;desplegar numero 2:
    int 21h
    
    call leer ;lee segundo numero
    sub al,30h ;restar 30h para obtener segundo valor
    mov var2,al ;guardar en var2
    mov bl,var2 ;mover a bl
    
                 
                 
            mov bl,var1
            sub bl,var2
            mov ah,09h 
            
             mov ah, 02h
            mov bh, 2
            mov dh, 15D
            mov dl, 34D
            int 10h 
            MOV AH, 09H
            lea dx,LINEA4 ;desplegar resta:
            int 21h
            mov dl,bl ;mover resta a dl para imprimir
            add dl,30h ;sumar 30 para obtener caracter
            mov ah,02h ;imprimir un caracter
            int 21h
            
            
            
             mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRESION
            mov ah, 09h 
            mov dx, offset LINEA5 ;PARA SALIR
            int 21h
            
             MOV AH, 0H
            INT 16H
            CMP AL, 032
            JE REGRESAR  
            
            MULTIPLICACION:
            ;CREAR PANTALLA 2
            
            MOV AH, 05H
            MOV AL, 2
            INT 10H
            
             call limpia 
            
            
            mov ah, 02h
            mov bh, 2
            mov dh, 08D
            mov dl, 12D
            int 10h 
              ;IMPRESION
                   
            
    mov ah,09h
    lea dx, msj1 ;desplegar numero 1:
    int 21h
    
    call leer ;lee primer numero
    sub al,30h ;restar 30h para obtener el numero
    mov var1,al ;lo guardo en var1 
    
            
            mov ah, 02h
            mov bh, 2
            mov dh, 09D
            mov dl, 12D
            int 10h
    
    mov ah,09h
    lea dx, msj2 ;desplegar numero 2:
    int 21h
    
    call leer ;lee segundo numero
    sub al,30h ;restar 30h para obtener segundo valor
    mov var2,al ;guardar en var2
    mov bl,var2 ;mover a bl
    
                 
                 
            mov bl,var1
            sub bl,var2
            mov ah,09h 
           
                 ;POSICIONA EL CURSOR
             mov ah, 02h
            mov bh, 2
            mov dh, 12D
            mov dl, 21h
            int 10h 
           
           
           
           ;******************MULTIPLICACION
    mov ah,09h
    lea dx,LINEA1 ;desplegar mult
    int 21h
    
    mov al,var1 
    mov bl,var2
    mul bl ;mult al=al*bl
    mov dl,al ;mover al a dl para imprimir
    add dl,30h ;sumar 30 para obtener caracter
    mov ah,02h ;imprimir caracter
    int 21h
           
           
            
            mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
             
            MOV AH, 0H
            INT 16H  
            CMP AL, 032
            JE REGRESAR
            
            DIVISION:
            ;CREAR PANTALLA 2
            
            MOV AH, 05H
            MOV AL, 2
            INT 10H
                
                
                
                call limpia 
            
            
            mov ah, 02h
            mov bh, 2
            mov dh, 08D
            mov dl, 12D
            int 10h 
              ;IMPRESION
                   
            
    mov ah,09h
    lea dx, msj1 ;desplegar numero 1:
    int 21h
    
    call leer ;lee primer numero
    sub al,30h ;restar 30h para obtener el numero
    mov var1,al ;lo guardo en var1 
    
            
            mov ah, 02h
            mov bh, 2
            mov dh, 09D
            mov dl, 12D
            int 10h
    
    mov ah,09h
    lea dx, msj2 ;desplegar numero 2:
    int 21h
    
    call leer ;lee segundo numero
    sub al,30h ;restar 30h para obtener segundo valor
    mov var2,al ;guardar en var2
    mov bl,var2 ;mover a bl
    
                 
                                
            mov bl,var1
            sub bl,var2
            mov ah,09h 
           
                 ;POSICIONA EL CURSOR
             mov ah, 02h
            mov bh, 2
            mov dh, 12D
            mov dl, 21h
            int 10h 
                
             
             
             mov ah,09h
    lea dx,LINEA1 ;desplegar div
    int 21h
    xor ax,ax ;limpiamos el registro ax. 
    mov al,var2
    mov bl,al
    mov al,var1
    div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
    mov bl,al
    mov dl,bl
    add dl,30h
    mov ah,02h
    int 21h
             
             
             
                
                
                
                
            
            mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
                
            MOV AH, 0H
            INT 16H
            ;--------------
            
            CMP AL, 032
            JE REGRESAR
            
            
            
            
            
            
            
            
            
            
            
            
            
            opc2:
           
            ;CREAR PANTALLA 2
            
            MOV AH, 05H
            MOV AL, 1
            INT 10H    
            
            
                 ;POSICIONA EL CURSOR
             mov ah, 02h
            mov bh, 1
            mov dh, 12D
            mov dl, 21h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA2
            int 21h 
            MOV AH, 0H
            INT 16H    
            
            
            
            mov ah,00h
   mov al,03h
   int 10h

   mov ah,02h
   mov dx,0510h
   mov bh,1
   int 10h
    

   mov ah,09h
   lea dx,msg4
   int 21h

   mov ah,07h
   int 21h

   mov ah, 02h
   mov dl,al
   int 21h
   mov  var3,al

   mov ah,09h
   lea dx,msg5
   int 21h

   mov ah,07h
   int 21h

   mov ah,02h
   mov dl,al
   int 21h
   mov var4,al


  cmp var3,al
  ja mayor
  jb menor
  je igual

mayor:  
     mov ah, 02h
            mov bh, 2
            mov dh, 12D
            mov dl, 21h
            int 10h 
              
      
   mov ah,09h
   lea dx,msg1
   int 21h
    mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
             
            MOV AH, 0H
            INT 16H  
            CMP AL, 032
            JE REGRESAR
             
  

menor:
        
   mov ah, 02h
   mov bh, 2 
   mov dh, 12D
            mov dl, 21h
            int 10h 
   mov ah,09h
   lea dx,msg2
   int 21h  
    mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
             
            MOV AH, 0H
            INT 16H  
            CMP AL, 032
            JE REGRESAR
            

igual:
mov ah, 02h
            mov bh, 2
            mov dh, 12D
            mov dl, 21h
            int 10h 

   mov ah,09h
   lea dx,msg3
   int 21h 
    mov ah, 02h
            mov bh, 2
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
             
            MOV AH, 0H
            INT 16H  
            CMP AL, 032
            JE REGRESAR
            


            
            
            
            
            
            
            
            
            
            
             
            mov ah, 02h
            mov bh, 1
            mov dh, 01D
            mov dl, 01h
            int 10h 
              ;IMPRECION
            mov ah, 09h 
            mov dx, offset LINEA5
            int 21h
            
            CMP AL, 032
            JE REGRESAR  
            
            
            
            
           
           
           REGRESAR:
           MOV AH, 5H
           MOV AL, 0
           INT 10H
         ;-----------------------
         ;PROCEDIMIENTOS
         salto proc near
    mov ah,09h
    lea dx,linea
    int 21h
    mov dl,00h
    ret
    salto endp
    
    leer proc near
    mov ah,01h;leer caracter desde el teclado
    int 21h;lee primer caracter
    ret
    leer endp
    
    limpia proc near
    mov ah,00h
    mov al,03h
    int 10h
    ret
    limpia endp
            
           
            
            
          ;AAAAAAAAAAAAAAAAAAAAAAAAA
          mov ah, 4ch
          int 21h     ; finaliza el programa 
        
          
             END
    
    
    
    
