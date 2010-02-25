;	getprocessor() - determine processor type	Author: Kees J. Bot
;								26 Jan 1994

;.sect .text; .sect .rom; .sect .data; .sect .bss
.586
.MODEL FLAT
.CODE

; int getprocessor(void);
;	Return 386, 486, 586, ...

PUBLIC	_getprocessor

_getprocessor:
	push	ebp
	mov	ebp, esp
	and	esp, 0FFFFFFFCh	; Align stack to avoid AC fault
	mov	ecx, 000040000h	; Try to flip the AC bit introduced on the 486
	call	flip
	mov	eax, 386	; 386 if it didn't react to "flipping"
	jz	gotprocessor
	mov	ecx, 00200000h	; Try to flip the ID bit introduced on the 586
	call	flip
	mov	eax, 486	; 486 if it didn't react
	jz	gotprocessor
	pushfd
	pusha			; Save the world
	mov	eax, 1
	cpuid
	and	ah, 0Fh	; Extract the family (5, 6, ...)
	movzx	eax, ah
	cmp	eax, 15		; 15: extended family
	jne	direct
	mov	eax, 6		; Make it 686
direct:
	imul	eax, 100	; 500, 600, ...
	add	eax, 86		; 586, 686, ...
	mov	28[esp], eax	; Pass eax through
	popa
	popfd
gotprocessor:
	leave
	ret

flip:
	pushfd			; Push eflags
	pop	eax		; eax = eflags
	mov	edx, eax	; Save original eflags
	xor	eax, ecx	; Flip the bit to test
	push	eax		; Push modified eflags value
	popfd			; Load modified eflags register
	pushfd
	pop	eax		; Get it again
	push	edx
	popfd			; Restore original eflags register
	xor	eax, edx	; See if the bit changed
	test	eax, ecx
	ret

END
