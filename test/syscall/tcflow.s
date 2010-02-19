.386
.MODEL FLAT
.CODE
EXTERN	__tcflow:NEAR
PUBLIC	_tcflow
ALIGN 2

_tcflow:
	jmp	__tcflow

END
