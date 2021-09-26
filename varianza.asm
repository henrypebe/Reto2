global asmVarianza
	section .text

asmVarianza:
limpieza:
	xorpd	xmm0,	xmm0
	xorpd	xmm1,	xmm1
	xorpd	xmm2,	xmm2
	cmp	rsi,	0
	je	done

    mov r8, rdi
    mov r9, 0
    mov r10, rsi

promedio:
	movss	xmm0,	[r8]
	addss	xmm1,	xmm0 ;xmm1 tendra el promedio
    add r8, 4
    inc r9
	dec r10
	cmp r10, 0
    jge promedio
salida:
    dec r9
    cvtsi2ss xmm2,  r9
    divss   xmm1,   xmm2 ;xmm1 tendra el promedio
    xorpd	xmm0,	xmm0
	xorpd	xmm2,	xmm2
    xorpd	xmm3,	xmm3

next:
	movss	xmm0,	[rdi]
    subss   xmm0,   xmm1
	mulss	xmm0,	xmm0
    addss   xmm2,   xmm0 ;tendra la varianza
	add	    rdi,	4
	dec     rsi
	jnz	next
salida_2:
    cvtsi2ss xmm3,  r9
    divss   xmm2,   xmm3 ;tendra la varianza
done:
	movss	[rdx],	xmm2
	ret