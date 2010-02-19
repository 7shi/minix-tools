.386
.MODEL FLAT
.CODE
EXTERN	__closedir:NEAR
PUBLIC	_closedir
ALIGN 2

_closedir:
	jmp	__closedir

END
