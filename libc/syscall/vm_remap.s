.386
.MODEL FLAT
.CODE
EXTERN	__vm_remap:NEAR
PUBLIC	_vm_remap
ALIGN 2

_vm_remap:
	jmp	__vm_remap

END
