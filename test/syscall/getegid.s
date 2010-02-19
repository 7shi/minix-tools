.386
.MODEL FLAT
.CODE
EXTERN	__getegid:NEAR
PUBLIC	_getegid
ALIGN 2

_getegid:
	jmp	__getegid

END
