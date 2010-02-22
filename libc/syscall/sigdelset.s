.386
.MODEL FLAT
.CODE
EXTERN	__sigdelset:NEAR
PUBLIC	_sigdelset
ALIGN 2

_sigdelset:
	jmp	__sigdelset

END
