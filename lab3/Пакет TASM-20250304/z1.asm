.model small
.stack 100h
.386 					;разрешение трансляции команд процессора 386
.data
Info db "Карасев Вадим 221", 13, 10, "$"
.code

start:
call print_info
mov ax, 60155 			;число в al
mov bx, 10 				;система счисления в bl

mov cx, 0 				;разрядноть
m1: mov dx, 0 			;помещаем в dx 0 (обнуляем перед каждым делением)

div bx 				;(ax) / (bx), остаток в dx, неполное частное в ax
push dx 				;сохраняем значения
inc cx 				;cx += 1
cmp ax, 0 				;сравниваем (ax - 0)
jne m1

m2: pop dx 				;выгружаем ax в dx
call print_digits
loop m2 				;повторяем пока cx != 0

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
push ax
mov ah, 02h
add dl, '0'
int 21h
pop ax
ret
print_digits endp

end start
