.model tiny               ;������ ����� TINY, � ���ன ���, ����� � �⥪
                          ;ࠧ������� � ����� � ⮬ �� ᥣ���� ࠧ��஬ �� 64��
.code                     ;��砫� ᥣ���� ����
org 100h                  ;��⠭�������� ���祭�� �ணࠬ����� ���稪� � 100h
                          ;��砫� ����室���� ��� COM-�ணࠬ��,
                          ;����� ����㦠���� � ������ � ���� PSP:100h

start:
mov AH,09h
mov DX,offset Hello
int 21h
mov AX,4C00h
int 21h
Hello db '���ᥢ ����� 221$'
end start