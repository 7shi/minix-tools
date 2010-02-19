.386
.MODEL FLAT
.CODE
EXTERN	__vm_adddma:NEAR
PUBLIC	_vm_adddma
EXTERN	__vm_deldma:NEAR
PUBLIC	_vm_deldma
EXTERN	__vm_getdma:NEAR
PUBLIC	_vm_getdma
ALIGN 2

_vm_adddma:
	jmp	__vm_adddma
_vm_deldma:
	jmp	__vm_deldma
_vm_getdma:
	jmp	__vm_getdma

END
