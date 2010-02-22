.386
.MODEL FLAT
.CODE
EXTERN	__fpathconf:NEAR
PUBLIC	_fpathconf
ALIGN 2

_fpathconf:
	jmp	__fpathconf

END
