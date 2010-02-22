.386
.MODEL FLAT
.CODE
EXTERN	__sync:NEAR
PUBLIC	_sync
ALIGN 2

_sync:
	jmp	__sync

END
