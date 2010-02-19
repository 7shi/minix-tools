.386
.MODEL FLAT
.CODE
EXTERN	___exit:NEAR
PUBLIC	__exit
ALIGN 2

__exit:
	jmp	___exit

END
