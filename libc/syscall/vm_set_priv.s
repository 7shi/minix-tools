.386
.MODEL FLAT
.CODE
EXTERN __vm_set_priv:NEAR
PUBLIC _vm_set_priv
ALIGN 2

_vm_set_priv:
	jmp	__vm_set_priv

END
