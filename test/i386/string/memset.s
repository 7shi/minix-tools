;	memset()					Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; void *memset(void *s, int c, size_t n)
;	Set a chunk of memory to the same byte value.
;
.CODE
PUBLIC _memset
	;ALIGN 16
_memset:
	push	ebp
	mov	ebp, esp
	push	edi
	mov	edi, 8[ebp]	; The string
	movzx	eax, byte ptr 12[ebp]	; The fill byte
	mov	ecx, 16[ebp]	; Length
	cld
	cmp	ecx, 16
	jb	sbyte_		; Don't bother being smart with short arrays
	test	edi, 1
	jnz	sbyte_		; Bit 0 set, use byte store
	test	edi, 2
	jnz	sword_		; Bit 1 set, use word store
slword:
	mov	ah, al
	mov	edx, eax
	sal	edx, 16
	or	eax, edx	; One byte to four bytes
	shrd	edx, ecx, 2	; Save low two bits of ecx in edx
	shr	ecx, 2
	rep stosd			; Store longwords.
	shld	ecx, edx, 2	; Restore low two bits
sword_:
	mov	ah, al		; One byte to two bytes
	shr	ecx, 1
	rep stosw			; Store words
	adc	ecx, ecx	; One more byte?
sbyte_:
	rep stosb			; Store bytes
done:
	mov	eax, 8[ebp]	; Return some value you have no need for
	pop	edi
	pop	ebp
	ret

END
