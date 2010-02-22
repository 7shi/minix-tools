.386
.MODEL FLAT
.CODE
EXTERN	__sigaddset:NEAR
PUBLIC	_sigaddset
ALIGN 2

_sigaddset:
	jmp	__sigaddset

END
