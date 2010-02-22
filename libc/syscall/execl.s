.386
.MODEL FLAT
.CODE
EXTERN	__execl:NEAR
PUBLIC	_execl
ALIGN 2

_execl:
	jmp	__execl

END
