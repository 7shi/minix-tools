; Translated from GNU to ACK by gas2ack
;.sect .text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT
.CODE
; 4 "__setjmp.gs"
EXTERN ___newsigset:NEAR
PUBLIC ___setjmp
___setjmp:
	mov	eax, 4[esp]	; jmp_buf
	mov	28[eax], edx	; save edx
	mov	edx, 0[esp]
	mov	8[eax], edx	; save program counter
	mov	12[eax], esp	; save stack pointer
	mov	16[eax], ebp	; save frame pointer
	mov	20[eax], ebx
	mov	24[eax], ecx
	mov	32[eax], esi
	mov	36[eax], edi

	mov	edx, 8[esp]	; save mask?
	mov	0[eax], edx	; save whether to restore mask
	test	edx, edx
	je	_1
	lea	edx, 4[eax]	; pointer to sigset_t
	push	edx
	call	___newsigset	; save mask	
	add	esp, 4
_1:
	mov	eax, 0
	ret

END
