.386
.MODEL FLAT
.CODE
EXTERN	__vm_getphys:NEAR
PUBLIC	_vm_getphys
ALIGN 2

_vm_getphys:
	jmp	__vm_getphys

END
