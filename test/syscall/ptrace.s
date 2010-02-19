.386
.MODEL FLAT
.CODE
EXTERN	__ptrace:NEAR
PUBLIC	_ptrace
ALIGN 2

_ptrace:
	jmp	__ptrace

END
