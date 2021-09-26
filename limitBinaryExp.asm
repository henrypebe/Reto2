global asmLimitBinaryExp
	section .text

asmLimitBinaryExp:
limpieza:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
    xorpd	xmm3,	xmm3
    xorpd	xmm4,	xmm4
    xorpd	xmm5,	xmm5
caculo_valor:
    mov r9, 1
    cvtsi2ss xmm4, r9
    cvtsi2ss xmm0, rdi
    mov r8, 1
    cvtsi2ss xmm1, r8
    cvtsi2ss xmm5, r8
    divss xmm1, xmm0
    addss xmm5, xmm1 ;se guardara el valor (1+1/N)

calculo:
    cvtsi2ss xmm0, rdi
    cvtsi2ss xmm1, rdi
    mov r8, 2
    cvtsi2ss xmm3, r8
    divss xmm1, xmm3
    cvtss2si r10, xmm1
    cvtsi2ss xmm2, r10
    mulss xmm2, xmm3
    subss xmm0, xmm2
    cvtss2si r10, xmm0
segun_limpieza:
    xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
    cmp r10, 0
    je no_impar
impar:
    mulss xmm4, xmm5
no_impar:
    mulss xmm5, xmm5
    cvtsi2ss xmm2, rdi
    divss xmm2, xmm3
    cvtss2si r9, xmm2
    mov rdi, r9
    cmp r9, 0
    jne calculo

done:
    movss xmm0, xmm4
	ret