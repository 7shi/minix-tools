; Translated from GNU to ACK by gas2ack
;.sect .text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT
.CODE
; 4 "longjmp.gs"
EXTERN ___oldsigset:NEAR
PUBLIC _longjmp
_longjmp:
	mov	eax, 4[esp]	; jmp_buf
	cmp	dword ptr [eax], 0	; save mask?
	je	_1
	lea	edx, 4[eax]	; pointer to sigset_t
	push	edx
	call	___oldsigset	; restore mask
	add	esp, 4
	mov	eax, 4[esp]	; jmp_buf
_1:
	mov	ecx, 8[esp]	; result value
	mov	esp, 12[eax]	; restore stack pointer

	mov	edx, 8[eax]	; restore program counter
	mov	0[esp], edx

	push	ecx	; save result code

	mov	ebp, 16[eax]	; restore frame pointer
	mov	ebx, 20[eax]
	mov	ecx, 24[eax]
	mov	edx, 28[eax]
	mov	esi, 32[eax]
	mov	edi, 36[eax]
	pop	eax
	test	eax, eax
	je	_2
	ret
_2:
	mov	eax, 1
	ret

END
