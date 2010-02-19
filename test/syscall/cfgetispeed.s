.386
.MODEL FLAT
.CODE
EXTERN	__cfgetispeed:NEAR
PUBLIC	_cfgetispeed
ALIGN 2

_cfgetispeed:
	jmp	__cfgetispeed

END
