.386
.MODEL FLAT
.CODE
EXTERN	__stat:NEAR
PUBLIC	_stat
ALIGN 2

_stat:
	jmp	__stat

END
