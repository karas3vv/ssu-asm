.model small
.stack 100h
.386 					;ࠧ�襭�� �࠭��樨 ������ ������ 386
.data
Info db "���ᥢ ����� 221", 13, 10, "$"
.code

start:
call print_info
mov ax, 60155 			;�᫮ � al
mov bx, 10 				;��⥬� ��᫥��� � bl

mov cx, 0 				;ࠧ�來���
m1: mov dx, 0 			;����頥� � dx 0 (����塞 ��। ����� ��������)

div bx 				;(ax) / (bx), ���⮪ � dx, �������� ��⭮� � ax
push dx 				;��࠭塞 ���祭��
inc cx 				;cx += 1
cmp ax, 0 				;�ࠢ������ (ax - 0)
jne m1

m2: pop dx 				;���㦠�� ax � dx
call print_digits
loop m2 				;�����塞 ���� cx != 0

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
push ax
mov ah, 02h
add dl, '0'
int 21h
pop ax
ret
print_digits endp

end start
