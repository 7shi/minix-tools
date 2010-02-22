.386
.MODEL FLAT
.CODE
EXTERN	__sigaction:NEAR
PUBLIC	_sigaction
ALIGN 2

_sigaction:
	jmp	__sigaction

END
