.386
.MODEL FLAT
.CODE
EXTERN	__killpg:NEAR
PUBLIC	_killpg
ALIGN 2

_killpg:
	jmp	__killpg

END
