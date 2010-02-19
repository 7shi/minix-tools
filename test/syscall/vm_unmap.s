.386
.MODEL FLAT
.CODE
EXTERN	__vm_unmap:NEAR
PUBLIC	_vm_unmap
ALIGN 2

_vm_unmap:
	jmp	__vm_unmap

END
