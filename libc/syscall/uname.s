.386
.MODEL FLAT
.CODE
EXTERN	__uname:NEAR
PUBLIC	_uname
ALIGN 2

_uname:
	jmp	__uname

END
