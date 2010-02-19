.386
.MODEL FLAT
.CODE
EXTERN	__dup:NEAR
PUBLIC	_dup
ALIGN 2

_dup:
	jmp	__dup

END
