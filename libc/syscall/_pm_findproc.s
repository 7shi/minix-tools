.386
.MODEL FLAT
.CODE
EXTERN	___pm_findproc:NEAR
PUBLIC	__pm_findproc
ALIGN 2

__pm_findproc:
	jmp	___pm_findproc

END
