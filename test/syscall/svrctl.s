.386
.MODEL FLAT
.CODE
EXTERN	__svrctl:NEAR
PUBLIC	_svrctl
ALIGN 2

_svrctl:
	jmp	__svrctl

END
