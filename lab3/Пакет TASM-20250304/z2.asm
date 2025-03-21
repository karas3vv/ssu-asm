.model small
.stack 100h
.386
.data
Info db "Карасев Вадим 221", 13, 10, '$'
.code

start:
call print_info 			;вывод информации
mov eax, 65536 			;загружаем число
mov ebx, 10 				;система счисления

mov ecx, 0
m1: mov edx, 0
div ebx
push edx 				;сохраняем результат
inc ecx 				;(ecx)++
cmp eax, 0 				;условие (eax) - 0
jne m1 				;если (eax) не равен 0, то идём в m1

m2: pop edx 				;иначе выполняем код дальше
call print_digits 			;процедура вывода цифры
loop m2 				;пока ecx != 0

mov ax, 4C00h
int 21h

;------ Процедуры ------
print_info proc
mov ax, @data
mov ds, ax
mov ah, 09h
mov dx, offset Info
int 21h
ret
print_info endp

print_digits proc
push eax
mov ah, 02h
add dl, '0'
int 21h
pop eax
ret
print_digits endp

end start
