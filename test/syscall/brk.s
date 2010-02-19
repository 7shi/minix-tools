.386
.MODEL FLAT
.CODE
EXTERN	__brk:NEAR
PUBLIC	_brk
ALIGN 2

_brk:
	jmp	__brk

END
