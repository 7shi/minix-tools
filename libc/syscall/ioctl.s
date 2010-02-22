.386
.MODEL FLAT
.CODE
EXTERN	__ioctl:NEAR
PUBLIC	_ioctl
ALIGN 2

_ioctl:
	jmp	__ioctl

END
