.386
.MODEL FLAT
.CODE
EXTERN __getitimer:NEAR
PUBLIC _getitimer
ALIGN 2

_getitimer:
	jmp	__getitimer

END
