.386
.MODEL FLAT
.CODE
EXTERN	__reboot:NEAR
PUBLIC	_reboot
ALIGN 2

_reboot:
	jmp	__reboot

END
