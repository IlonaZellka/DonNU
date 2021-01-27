wow segment 'code'
assume cs:wow, ds:wow, ss:wow, es:wow
org 100h
begin: jmp main
;---------------------------------
date dw ?
my_s db '+'
T_Th db ?
Th db ?
Hu db ?
Tens db ?
Ones db ?

term dw ?

MAIN proc near
; ---------------- 1 ex ---------------------------------
mov ax, 13
sub ax, 5	    ; 13-5
mov bl, 4
idiv bl	      ; (13-5)/4 = 2

mov bl, 5 	  ; 2*5 = 10
imul bl

add ax, 553  	; 10 + 553 = 563
mov term, ax

mov ax, 125   
mov bl, 25
idiv bl	      ; 125/25 = 5
cbw

add ax, term	; 5+563 = 568
mov date,ax
call DISP

; ---------------- 2 ex ---------------------------------
mov ax, 115
sub ax, 15  	; 115-15
mov bl, 100
idiv bl	      ; (115-15)/100 = 1

mov bl, 10	  ; 1*10 = 10
imul bl

mov bl, 2	    ; 10*2 = 20
imul bl
mov term, ax

mov ax, 144
sub ax, 4	     ; 144-4=140

mov bl, 75
sub bl, 5 	   ; 75-5=70

idiv bl	       ; 140/70=2
cbw

mov bl, 25       
add bl, 15   	  ; 25+15=40

imul bl         ; 2*40 = 80

add ax, term    ; 80+20=100

mov date,ax
call DISP
ret
MAIN endp
; Процедура выводит результат вычислений, помещенный в data
DISP proc near
;----- Вывод результата на экран ----------------
;--- Число отрицательное ?----------
mov ax,date
and ax,1000000000000000b
mov cl,15
shr ax,cl
cmp ax,1
jne @m1
mov ax,date
neg ax
mov my_s,'-'
jmp @m2
;--- Получаем десятки тысяч ---------------
@m1: mov ax,date
@m2: cwd
mov bx,10000
idiv bx

mov T_Th,al
;------- Получаем тысячи ------------------------------
mov ax,dx
cwd
mov bx,1000
idiv bx
mov Th,al
;------ Получаем сотни ---------------
mov ax,dx
mov bl,100
idiv bl
mov Hu,al
;---- Получаем десятки и единицы ----------------------
mov al,ah
cbw
mov bl,10
idiv bl
mov Tens,al
mov Ones,ah
;--- Выводим знак -----------------------
cmp my_s,'+'
je @m500
mov ah,02h
mov dl,my_s
int 21h
;---------- Выводим цифры -----------------
@m500: cmp T_TH,0 ; проверка на ноль
je @m200
mov ah,02h ; выводим на экран, если не ноль
mov dl,T_Th
add dl,48
int 21h
@m200: cmp T_Th,0
jne @m300
cmp Th,0
je @m400
@m300: mov ah,02h
mov dl,Th
add dl,48
int 21h
@m400: cmp T_TH,0
jne @m600
cmp Th,0

jne @m600
cmp hu,0
je @m700
@m600: mov ah,02h
mov dl,Hu
add dl,48
int 21h
@m700: cmp T_TH,0
jne @m900
cmp Th,0
jne @m900
cmp Hu,0
jne @m900
cmp Tens,0
je @m950
@m900: mov ah,02h
mov dl,Tens
add dl,48
int 21h
@m950: mov ah,02h
mov dl,Ones
add dl,48
int 21h
mov ah,02h
mov dl,10
int 21h
mov ah,02h
mov dl,13
int 21h
;-------------------------------------
mov ah,08
int 21h
ret
DISP endp
wow ends
end begin