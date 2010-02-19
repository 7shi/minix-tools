.386
.MODEL FLAT
.CODE
EXTERN	__getngid:NEAR
PUBLIC	_getngid
ALIGN 2

_getngid:
	jmp	__getngid

END
