model small
stack 100h
.186 ; ����襭�� ������ ������ 80186

.data
simple db 20 dup (7)    ; ���ᨢ �� 20 ���� ��� �࠭���� �ᥫ
result db '    $'       ; ��ଠ� �뢮�� �᫠ � ��ࠢ�������� �� �ࠢ��� ���
nl db 0Dh, 0Ah, '$'     ; ��ॢ�� ��ப� � ������ ���⪨

.code
start:
    mov ax, @data       ; ���樠������ ᥣ���⭮�� ॣ���� DS
    mov ds, ax

; ���������� ���ᨢ� numbers
    mov cx, 10          ; ��᫮ 蠣�� � 横�� (10)
    mov bl, 2           ; ��砫쭮� ���祭�� (2)
    mov si, 0           ; ��砫�� ������ ���ᨢ� simple

vvod:
    mov simple[si], bl  ; ������ BL � ⥪�騩 ����� ���ᨢ�
    mov al, 5
    mul bl              ; ��������� AL �� BL (१���� � AX)
    mov simple[si + 10], al ; ������ १���� �� ����� �������� ���ᨢ�
    inc si              ; ���室 � ᫥���饬� ������ ���ᨢ�
    add bl, 2           ; �����祭�� ���祭�� BL �� 2
    loop vvod           ; ���室 � ��砫� 横��, ���� CX != 0

; �뢮� ���ᨢ� (2 ��ப� �� 10 �ᥫ)
    mov cx, 2           ; ���譨� 横� �믮������ 2 ࠧ�
    mov si, 0           ; ��砫�� ������ ���ᨢ� simple

outer_loop:
    push cx             ; ���࠭塞 CX (����稪 ���譥�� 横��) � �⥪
    mov cx, 10          ; ��⠭�������� ����稪 ��� ����७���� 横�� (10 �ᥫ)

vyvod:
    mov al, simple[si]  ; ����㦠�� ����� ���ᨢ� � AL
    mov bl, 10          ; �᭮����� ��⥬� ��᫥��� (10)
    call byte_asc       ; �맮� ��楤��� �८�ࠧ������ �᫠ � ��ப�

    ; �뢮� �᫠ �� �࠭
    mov ah, 9           ; �㭪�� DOS ��� �뢮�� ��ப�
    mov dx, offset result ; ���� ��ப� result
    int 21h             ; �맮� DOS ���뢠���

    inc si              ; ���室 � ᫥���饬� ������ ���ᨢ�
    loop vyvod          ; �����塞 ����७��� 横� 10 ࠧ

    ; ���室 �� ����� ��ப� ��᫥ �뢮�� 10 �ᥫ
    mov dx, offset nl   ; ���� ��ப� nl (����� ��ப�)
    mov ah, 9           ; �㭪�� DOS ��� �뢮�� ��ப�
    int 21h             ; �맮� DOS ���뢠���

    pop cx              ; ����⠭�������� CX �� �⥪� ��� ���譥�� 横��
    loop outer_loop     ; �����塞 ���譨� 横� 2 ࠧ�

    mov ax, 4C00h       ; �����襭�� �ணࠬ�� (���४�� ��� ��室�)
    int 21h

; ��楤�� �८�ࠧ������ �᫠ � ��ப�
byte_asc proc
    pusha               ; ���࠭塞 ॣ�����
    mov si, 3           ; ����� ��ப� १���� (������ 3)

next_digit:
    dec si              ; ���室 � ᫥���饩 ����樨 �ࠢ� ������
    mov ah, 0           ; ����塞 AH ��� ������� AX �� BL
    div bl              ; ������� AX �� BL (10)
    add ah, '0'         ; �८�ࠧ㥬 ���� � ASCII-���
    mov result[si], ah  ; ���࠭塞 ASCII-ᨬ��� � ��ப� result
    cmp al, 0           ; �஢��塞, �� �㫥��� �� ��⭮�
    jne next_digit      ; �᫨ �� ����, �த������ ������

    popa                ; ����⠭�������� ॣ�����
    ret
byte_asc endp

end start