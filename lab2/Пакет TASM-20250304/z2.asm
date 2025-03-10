.model tiny 			;������ ����� tiny
;(��� ��� �ணࠬ�� �뤥����� 1 ᥣ���� �����)
.code
org 100h 			;���祭�� �ணࠬ����� ����稪� � 100h

start:
; ======�᭮���� ���======

mov AX, 3 			;�ࠧ� �����뢠�� ��� ���� � ॣ�����
mov BX, 4

mov AH, 09h
mov DX, offset Info
int 21h 			;�뢮� ��ப�

call print_digits 		;�맮� ��楤��� print_digits
XCHG AX, BX 			;���塞 ���祭�� AX � BX ���⠬�
call new_line 		;�맮� ��楤��� new_line
call print_digits 		;�맮� ��楤��� print_digits

mov AX, 4C00h
int 21h 			;�����稢���

; ======��楤���======
proc print_digits NEAR 	;��楤�� ��� �뢮�� ���� ��� �१
;�஡��
; ------��ࢠ� ���------

push AX 			;��訬 � �⥪
push BX 			;�⮡� ��࠭��� �� ���� ���祭��

add AL, 30h 			;ᮣ��᭮ ⠡��� ASCII
mov DL, AL 			;��� �뢮��
mov AH, 02h 			;������� �뢮�� ᨬ����
int 21h 			;DOS

call space 			;�맮� ��楤��� space

; ------���� ���------

add BL, 30h 			;ᮣ��᭮ ⠡��� ASCII
mov DL, BL 			;��� �뢮��
mov AH, 02h 			;������� �뢮�� ᨬ����
int 21h 			;DOS

pop BX 			;�����頥� ���祭��
pop AX 			;� "����"

Ret 				;������ ��뢠���� ��楤���
print_digits endp 		;����� ��楤���

Proc new_line NEAR 		;��楤�� ��� ���室� �� �����
;��ப�
; ------����� ��ப�------

push AX 			;��訬 � �⥪
push BX 			;�⮡� ��࠭��� �� ���� ���祭��
mov AH, 02h 			;������� �뢮�� ᨬ����
mov DL, 13 			;��� �뢮��
int 21h 			;DOS

mov DL, 10 			;��� ���室� �� ����� ��ப� �㦭�
;�ᯮ�짮���� 13, 10 ��� 0Dh, 0Ah
int 21h

pop BX 			;�����頥� ���祭��
pop AX 			;� "����"

Ret 				;������ ��뢠���� ��楤���
new_line endp 		;����� ��楤���

Proc space NEAR 		;��楤�� ��� �뢮�� �஡���
; ------�஡��------

push AX 			;��訬 � �⥪
push BX 			;�⮡� ��࠭��� �� ���� ���祭��

mov BL, 0h 			;�� �஡�� (��� ���⮩ ᨬ���,
mov DL, BL 			;�� ࠡ�⠥� ��� �஡��)
mov AH, 02h 			;������� �뢮�� ᨬ����
int 21h 			;DOS

pop BX 			;�����頥� ���祭��
pop AX 			;� "����"

Ret 				;������ ��뢠���� ��楤���
space endp 			;����� ��楤���
; ======�����======
Info db '���ᥢ ����� 221', 13, 10, '$'	;��ப� � ���室�� �� �����
end start
 