section .data
    limit dd 2.71828

global asmLimite
	section .text

asmLimite:
limpieza:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
    xorpd	xmm3,	xmm3

verificacion:
    cmp	rdi,	100000 ;SE VERIFICA SI EL VALOR DE N ES MAYOR A UN NUMERO GRANDE
	jge	infinito

calculo:
    cvtsi2ss xmm0, rdi
    mov r8, 1
    cvtsi2ss xmm1, r8
    cvtsi2ss xmm3, r8
    cvtsi2ss xmm2, r8
    divss xmm1, xmm0
    addss xmm3, xmm1

bucle:
    mulss xmm2, xmm3
    dec rdi
    cmp rdi, 0
    jne bucle

solucion:
    movss	[rsi],	xmm2
    jmp done
infinito:
    movss   xmm2,   [rel limit]  ;TOMA EL VALOR DE e
    movss	[rsi],	xmm2
done:
	ret