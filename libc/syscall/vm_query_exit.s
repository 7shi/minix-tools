.386
.MODEL FLAT
.CODE
EXTERN __vm_query_exit:NEAR
PUBLIC _vm_query_exit
ALIGN 2

_vm_query_exit:
	jmp	__vm_query_exit

END
