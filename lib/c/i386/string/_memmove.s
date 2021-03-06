;	_memmove()					Author: Kees J. Bot
;								2 Jan 1994
;.sect text; .sect .rom; .sect .data; .sect .bss
.386
.MODEL FLAT

; void *_memmove(void *s1, const void *s2, size_t n)
;	Copy a chunk of memory.  Handle overlap.
;
.CODE
PUBLIC __memmove, __memcpy
	;ALIGN 16
__memmove:
	push	ebp
	mov	ebp, esp
	push	esi
	push	edi
	mov	edi, 8[ebp]	; String s1
	mov	esi, 12[ebp]	; String s2
	mov	ecx, 16[ebp]	; Length
	mov	eax, edi
	sub	eax, esi
	cmp	eax, ecx
	jb	downwards	; if (s2 - s1) < n then copy downwards
__memcpy:
	cld			; Clear direction bit: upwards
	cmp	ecx, 16
	jb	upbyte		; Don't bother being smart with short arrays
	mov	eax, esi
	or	eax, edi
	test	al, 1
	jnz	upbyte		; Bit 0 set, use byte copy
	test	al, 2
	jnz	upword		; Bit 1 set, use word copy
uplword:shrd	eax, ecx, 2	; Save low 2 bits of ecx in eax
	shr	ecx, 2
	rep movsd			; Copy longwords.
	shld	ecx, eax, 2	; Restore excess count
upword:	shr	ecx, 1
    rep movsw			; Copy words
	adc	ecx, ecx	; One more byte?
upbyte:
	rep movsb			; Copy bytes
done:	mov	eax, 8[ebp]	; Absolutely noone cares about this value
	pop	edi
	pop	esi
	pop	ebp
	ret

; Handle bad overlap by copying downwards, don't bother to do word copies.
downwards:
	std			; Set direction bit: downwards
	lea	esi, [esi+ecx*1-1]
	lea	edi, [edi+ecx*1-1]
	rep movsb			; Copy bytes
	cld
	jmp	done

END
