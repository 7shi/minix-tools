.386
.MODEL FLAT
.CODE
EXTERN	__setgid:NEAR
PUBLIC	_setgid
EXTERN	__setegid:NEAR
PUBLIC	_setegid
ALIGN 2

_setgid:
	jmp	__setgid

_setegid:
	jmp	__setegid

END
