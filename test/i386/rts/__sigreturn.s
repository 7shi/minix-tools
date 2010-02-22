.386
.MODEL FLAT
; This routine is the low-level code for returning from signals.  
; It calls __sigreturn, which is the normal "system call" routine.
; Both ___sigreturn and __sigreturn are needed.
;.sect .text; .sect .rom; .sect .data; .sect .bss
.CODE
PUBLIC ___sigreturn
EXTERN __sigreturn:NEAR
___sigreturn:
	add esp, 16
	jmp __sigreturn

END
