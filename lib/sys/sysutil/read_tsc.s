; sections

;.sect .text; .sect .rom; .sect .data; .sect .bss
.586
.MODEL FLAT

PUBLIC	_read_tsc	; read the cycle counter (Pentium and up)

.CODE
;*===========================================================================*
; PUBLIC void read_tsc(unsigned long *high, unsigned long *low);
; Read the cycle counter of the CPU. Pentium and up. 
;.align 16
_read_tsc:
	push edx
	push eax
	rdtsc		; it places the TSC in EDX:EAX
	push ebp
	mov ebp, 16[esp]
	mov [ebp], edx
	mov ebp, 20[esp]
	mov [ebp], eax
	pop ebp
	pop eax
	pop edx
	ret

;*===========================================================================*
; PUBLIC void read_host_time_ns(unsigned long *high, unsigned long *low);
; access real time in ns from host in vmware.
;.align 16
_read_host_time_ns:
	push edx
	push eax
	push ecx
	mov ecx, 010001h
	rdpmc		; it places the result in EDX:EAX
	push ebp
	mov ebp, 20[esp]
	mov [ebp], edx
	mov ebp, 24[esp]
	mov [ebp], eax
	pop ebp
	pop ecx
	pop eax
	pop edx
	ret

END
