.386
.MODEL FLAT
.CODE
EXTERN	__pathconf:NEAR
PUBLIC	_pathconf
ALIGN 2

_pathconf:
	jmp	__pathconf

END
