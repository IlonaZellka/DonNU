nata segment 'code'
assume cs:nata
org 100h
begin: jmp main
;--------------------------------- DATA
Roads DB 11,'MOC11    ',12,'HAR12    ' 
DB 13,'KIR13    ',14,'LOP14    '
DB 15,'JUN15    ',16,'POC16    '
DB 17,'YIV17    ',18,'AUT18    '
DB 19,'SET19    ',20,'XOR20    '

Rezult DB 9 Dup(?),'$'
Buf DB 3,3 Dup(?)
Number DB ?
Mes DB 'Not found!$'
Eter DB 10,13,'$' ;перевод строки (доллар-конец строки)
Podskaz DB 'Enter number:$'
;---------------------------------
main proc near
;------------------------------------- PROGRAM
; ------ Подсказка -------
mov ah,09
lea dx,podskaz
int 21h           ;9 функция 21 прерывания вывод на экран строку
; Ввод строки
mov ah,0ah
lea dx,Buf
int 21h         ;10 функция 21 прерывания для ввода
; Преобразование символов в число
; Получаем десятки из буфера
mov bl,buf+2  ;берём 1 цифру, которую мы ввели
sub bl,30h
mov al,10
imul bl ; в al - десятки
; Получаем единицы из буфера
mov bl,buf+3  ;берём 2 цифру, которую мы ввели
sub bl,30h
; Складываем ------
add al,bl
mov number,al ; сохраняем в number
; -------- Переход на новую строку ---
mov ah,09h
lea dx,eter
int 21h
; --- сканирование таблицы дорог ----
cld ; искать слева направо

mov cx,100 ; сколько байт сканировать
lea di,roads ; строка, где искать (загружаем адрес первого символа в строке)
mov al,number ; что искать
repne scasb ; поиск (сканирование строки на поиск искомого значения)
je @m2
; ------- Сообщение об отсутствии дороги
mov ah,09h
lea dx,Mes
int 21h
jmp @m3 ; выходим из программы
; -------- переписываем в результат
@m2:
cld
mov si,di ;si-откуда пересылаем
lea di,rezult ;di-адрес первой ячейки
mov cl,9
rep movsb ;пересылка
; ----- Вывод результата ----
mov ah,09h ;9 функция 21 прерывания выводит результат
lea dx,rezult
int 21h
;-------------------------------------
@m3: mov ah,08 ;8 функция 21 прерывания ждёт нажатия пользователя
int 21h
ret
main endp
nata ends
end begin
