.386
.MODEL FLAT
.CODE
EXTERN	__cfsetospeed:NEAR
PUBLIC	_cfsetospeed
ALIGN 2

_cfsetospeed:
	jmp	__cfsetospeed

END
