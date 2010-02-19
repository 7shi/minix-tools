.386
.MODEL FLAT
.CODE
EXTERN	__chroot:NEAR
PUBLIC	_chroot
ALIGN 2

_chroot:
	jmp	__chroot

END
