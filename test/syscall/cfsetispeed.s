.386
.MODEL FLAT
.CODE
EXTERN	__cfsetispeed:NEAR
PUBLIC	_cfsetispeed
ALIGN 2

_cfsetispeed:
	jmp	__cfsetispeed

END
