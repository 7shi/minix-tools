.386
.MODEL FLAT
.CODE
EXTERN	__vm_getrefcount:NEAR
PUBLIC	_vm_getrefcount
ALIGN 2

_vm_getrefcount:
	jmp	__vm_getrefcount

END
