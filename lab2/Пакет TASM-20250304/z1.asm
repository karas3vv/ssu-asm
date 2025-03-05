.model tiny               ;������ ����� TINY, � ���ன ���, ����� � �⥪
                          ;ࠧ������� � ����� � ⮬ �� ᥣ���� ࠧ��஬ �� 64��
.code                     ;��砫� ᥣ���� ����
org 100h                  ;��⠭�������� ���祭�� �ணࠬ����� ���稪� � 100h
                          ;��砫� ����室���� ��� COM-�ணࠬ��,
                          ;����� ����㦠���� � ������ � ���� PSP:100h

start:
;===== Main Code =====

mov AH,09h                
mov DX,offset Info
int 21h                   ;�뢮� �� + ����� ��㯯�

call first                ;�맮� ��楤��� first
call space                ;�맮� ��楤��� space
call second               ;�맮� ��楤��� second

mov AX,4C00h
int 21h                   ;�����稢���

;===== Procedures =====

first Proc NEAR           ;��楤�� ��� �뢮�� ��ࢮ� ����
	mov AL, 3h
	add AL, 30h         ;ᮣ��᭮ ⠡��� ASCII
	mov DL, AL          ;��� �뢮��
	mov AH, 02h         ;������� �뢮�� ᨬ����
	int 21h             ;DOS
	Ret                 ;������ ��뢠���� ��楤���
first endp                ;����� ��楤���

space Proc NEAR           ;��楤�� ��� �뢮�� �஡���
mov BL, 0h          ;�� ⠡���, 0h - �஡��
mov DL, BL          ;��� �뢮��
mov AH, 02h         ;������� �뢮�� ᨬ����
int 21h             ;DOS
Ret                 ;������ �뤠������ ��楤���
space endp                ;����� ��楤���

second Proc NEAR           ;��楤�� ��� �뢮�� ��ன ����
	mov BL, 4h
	add BL, 30h             ;ᮣ��᭮ ⠡��� ASCII
	mov DL, BL
	mov AH, 02h             ;������� �뢮�� ᨬ����
	int 21h                 ;DOS
	Ret                     ;������ ��뢠���� ��楤���
second endp             ;����� ��楤���

;===== Data =====

Info db '���ᥢ ����� 221', 13, 10, '$' ;��ப� � ���室�� �� �����
end start
