.386
.MODEL FLAT
.CODE
EXTERN	__umount:NEAR
PUBLIC	_umount
ALIGN 2

_umount:
	jmp	__umount

END
