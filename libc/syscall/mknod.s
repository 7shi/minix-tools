.386
.MODEL FLAT
.CODE
EXTERN	__mknod:NEAR
PUBLIC	_mknod
ALIGN 2

_mknod:
	jmp	__mknod

END
