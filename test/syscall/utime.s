.386
.MODEL FLAT
.CODE
EXTERN	__utime:NEAR
PUBLIC	_utime
ALIGN 2

_utime:
	jmp	__utime

END
