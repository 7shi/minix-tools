.386
.MODEL FLAT
.CODE
EXTERN	__creat:NEAR
PUBLIC	_creat
ALIGN 2

_creat:
	jmp	__creat

END
