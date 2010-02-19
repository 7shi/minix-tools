.386
.MODEL FLAT
.CODE
EXTERN	__sigfillset:NEAR
PUBLIC	_sigfillset
ALIGN 2

_sigfillset:
	jmp	__sigfillset

END
