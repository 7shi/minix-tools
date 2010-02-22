.386
.MODEL FLAT
.CODE
EXTERN	__setgroups:NEAR
PUBLIC	_setgroups
ALIGN 2

_setgroups:
	jmp	__setgroups

END
