.386
.MODEL FLAT
.CODE
EXTERN __setitimer:NEAR
PUBLIC _setitimer
ALIGN 2

_setitimer:
	jmp	__setitimer

END
