.386
.MODEL FLAT
.CODE
EXTERN	__cfgetospeed:NEAR
PUBLIC	_cfgetospeed
ALIGN 2

_cfgetospeed:
	jmp	__cfgetospeed

END
