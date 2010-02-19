.386
.MODEL FLAT
.CODE
EXTERN	__sbrk:NEAR
PUBLIC	_sbrk
ALIGN 2

_sbrk:
	jmp	__sbrk

END
