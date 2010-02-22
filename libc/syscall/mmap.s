.386
.MODEL FLAT
.CODE
EXTERN	__mmap:NEAR
PUBLIC	_mmap
EXTERN	__munmap:NEAR
PUBLIC	_munmap
EXTERN	__munmap_text:NEAR
PUBLIC	_munmap_text
ALIGN 2

_mmap:
	jmp	__mmap

_munmap:
	jmp	__munmap

_munmap_text:
	jmp	__munmap_text

END
