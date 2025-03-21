.model small
.stack 100h
.386
.data
Info db "���ᥢ ����� 221", 13, 10, '$'
.code

start:
call print_info 			;�뢮� ���ଠ樨
mov eax, 65536 			;����㦠�� �᫮
mov ebx, 10 				;��⥬� ��᫥���

mov ecx, 0
m1: mov edx, 0
div ebx
push edx 				;��࠭塞 १����
inc ecx 				;(ecx)++
cmp eax, 0 				;�᫮��� (eax) - 0
jne m1 				;�᫨ (eax) �� ࠢ�� 0, � ��� � m1

m2: pop edx 				;���� �믮��塞 ��� �����
call print_digits 			;��楤�� �뢮�� ����
loop m2 				;���� ecx != 0

mov ax, 4C00h
int 21h

;------ ��楤��� ------
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
