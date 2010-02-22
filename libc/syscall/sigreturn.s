.386
.MODEL FLAT
.CODE
EXTERN	__sigreturn:NEAR
PUBLIC	_sigreturn
ALIGN 2

_sigreturn:
	jmp	__sigreturn

END
