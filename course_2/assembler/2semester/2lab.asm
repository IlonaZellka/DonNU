ADDING macro p ;����������, ����� ������� ���������� � ������
local @w4,@w5
mov min,127 ; ������� �����
mov cl,p ; ������� �����
mov bp,0 ; ��������� �������
@w4:
mov al,spisok+bp
cmp al,num
jge @w5
; ������� ������� ������ ��������
mov num,al
@w5: add bp,1 ; � ����.�������� ������
loop @w4
endm

vasya segment 'code'
assume cs:tanya, ds:tanya, ss:tanya, es:tanya
org 100h
begin: jmp main
;-------������ -------------------
SPISOK db 10,15,45,67,89,44,7,34,37,12
db 17,19,23,27,46,83,18,11,3,16
db 4,55,2,98,93
sk db ?
pr db 10,13,'����� ������� �������� � ������?', 10,13,'$'
buf db 4,4 dup(?)
ps db 10,13,'$'
des db ?
ed db ?
otv db 10,13,'������� ����� ���� ���������= $'
num db ?
;---------------------------------
main proc near
;-------������� ��������� --------
call skolko
call pechat
;************* ���������� ********************************
ADDING sk
;****************************************************
call otvet
ret
main endp
; ************** ������ � ������, ������� ��������� ����� �� ������ **********
skolko proc near
; ���������
mov ah,09
lea dx,pr
int 21h
; ��������� � ������ ����� ��� ������
mov ah,0ah

lea dx,buf
int 21h
; ����������� ������ � �����
cmp buf+1,1 ; ������� �������� �����?
jne @w1
;���� ������ �����
mov al,buf+2
sub al,30h
jmp @w2
@w1: ; ��� �����
mov al,buf+2
sub al,30h
mov bl,10
imul bl
mov bl,buf+3
sub bl,30h
add al,bl
@w2: mov sk,al
; ������� ������
mov ah,09
lea dx,ps
int 21h
ret
skolko endp
;************* ������� �������� ������ �� ����� ****************************
pechat proc near
mov cl,sk
mov bp,0
@w3:
mov al,SPISOK+bp ; ���� ������� ������
cbw ; al --> ax
mov bl,10
idiv bl
mov des,al
mov ed,ah
; ������� �������
mov ah,02
mov dl,des
add dl,30h
int 21h
; ������� �������
mov ah,02
mov dl,ed
add dl,30h
int 21h
; ������� ������
mov ah,02
mov dl,' '
int 21h

add bp,1 ; ������� � ���������� ��������
loop @w3
mov ah,09
lea dx,ps
int 21h
ret
pechat endp
;***********************************************************
otvet proc near
mov ah,09
lea dx,otv
int 21h
; ����� ����� �� ����� �����
mov al,min
cbw ; al --> ax
mov bl,10
idiv bl
mov des,al
mov ed,ah
; ������� �������
mov ah,02
mov dl,des
add dl,30h
int 21h
; ������� �������
mov ah,02
mov dl,ed
add dl,30h
int 21h
; ������� ������
mov ah,09
lea dx,ps
int 21h
; �������� ������� �� �������
mov ah,08
int 21h
ret
otvet endp
tanya ends
end begin