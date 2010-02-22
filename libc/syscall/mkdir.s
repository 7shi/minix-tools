.386
.MODEL FLAT
.CODE
EXTERN	__mkdir:NEAR
PUBLIC	_mkdir
ALIGN 2

_mkdir:
	jmp	__mkdir

END
