.386
.MODEL FLAT
.CODE
EXTERN	__getgroups:NEAR
PUBLIC	_getgroups
ALIGN 2

_getgroups:
	jmp	__getgroups

END
