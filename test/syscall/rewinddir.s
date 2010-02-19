.386
.MODEL FLAT
.CODE
EXTERN	__rewinddir:NEAR
PUBLIC	_rewinddir
ALIGN 2

_rewinddir:
	jmp	__rewinddir

END
