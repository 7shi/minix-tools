.386
.MODEL FLAT
.CODE
EXTERN	__setuid:NEAR
PUBLIC	_setuid
EXTERN	__seteuid:NEAR
PUBLIC	_seteuid
ALIGN 2

_setuid:
	jmp	__setuid

_seteuid:
	jmp	__seteuid

END
