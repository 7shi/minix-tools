.386P
.MODEL FLAT
.CODE

W = 4

P_STACKBASE = 0
GSREG = P_STACKBASE
FSREG = GSREG+2
ESREG = FSREG+2
DSREG = ESREG+2
DIREG = DSREG+2
SIREG = DIREG+W
BPREG = SIREG+W
STREG = BPREG+W
BXREG = STREG+W
DXREG = BXREG+W
CXREG = DXREG+W
AXREG = CXREG+W
RETADR = AXREG+W
PCREG = RETADR+W
CSREG = PCREG+W
PSWREG = CSREG+W
SPREG = PSWREG+W
SSREG = SPREG+W
P_STACKTOP = SSREG+W
FP_SAVE_AREA_P = P_STACKTOP
P_LDT_SEL = FP_SAVE_AREA_P+532
P_CR3 = P_LDT_SEL+W
P_LDT = P_CR3+W
P_MISC_FLAGS = P_LDT+50
Msize = 9

PUBLIC	_monitor
PUBLIC	_int86
PUBLIC	_exit
PUBLIC	__exit
PUBLIC	___exit
PUBLIC	___main
PUBLIC	_phys_insw
PUBLIC	_phys_insb
PUBLIC	_phys_outsw
PUBLIC	_phys_outsb
PUBLIC	_phys_copy
PUBLIC	_phys_copy_fault
PUBLIC	_phys_copy_fault_in_kernel
PUBLIC	_phys_memset
PUBLIC	_mem_rdw
PUBLIC	_reset
PUBLIC	_halt_cpu
PUBLIC	_level0
PUBLIC	_read_cpu_flags
PUBLIC	_read_cr0
PUBLIC	_read_cr2
PUBLIC	_getcr3val
PUBLIC	_write_cr0
PUBLIC	_read_cr4
EXTERN	_thecr3:DWORD
PUBLIC	_write_cr4

;PUBLIC	_catch_pagefaults
PUBLIC	_read_ds
PUBLIC	_read_cs
PUBLIC	_read_ss
PUBLIC	_idt_reload

PUBLIC	_fninit
PUBLIC	_fnstsw
PUBLIC	_fnstcw

EXTERN _gdt:NEAR, _reg86:NEAR
EXTERN _mon_sp:DWORD, _mon_return:DWORD, _irq_use:DWORD, _lost_ticks:DWORD

_monitor:
	mov	esp, _mon_sp
	mov	dx, 40
	mov	ds, dx
	mov	es, dx
	mov	fs, dx
	mov	gs, dx
	mov	ss, dx
	pop	edi
	pop	esi
	pop	ebp
	db 066h
	retf

_int86:
	cmp	byte ptr [_mon_return], 0
	jne	_0
	mov	ah, 1
	mov	byte ptr [_reg86+0], ah
	mov	byte ptr [_reg86+13], ah
	ret
_0:
	push	ebp
	push	esi
	push	edi
	push	ebx
	pushf
	cli

	in	al, 0A1h
	mov	ah, al
	in	al, 021h
	push	eax
	mov	eax, _irq_use
	and	eax, 0fffffffeh
	out	021h, al
	mov	al, ah
	out	0A1h, al

	mov	eax, 5*8
	mov	ss, ax
	xchg	esp, _mon_sp
	push	dword ptr [_reg86+36]
	push	dword ptr [_reg86+32]
	push	dword ptr [_reg86+28]
	push	dword ptr [_reg86+24]
	push	dword ptr [_reg86+20]
	push	dword ptr [_reg86+16]
	push	dword ptr [_reg86+12]
	push	dword ptr [_reg86+8]
	push	dword ptr [_reg86+4]
	push	dword ptr [_reg86+0]
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	push	cs
	push	return
	jmp	dword ptr [esp+76]
return:
	pop	dword ptr [_reg86+0]
	pop	dword ptr [_reg86+4]
	pop	dword ptr [_reg86+8]
	pop	dword ptr [_reg86+12]
	pop	dword ptr [_reg86+16]
	pop	dword ptr [_reg86+20]
	pop	dword ptr [_reg86+24]
	pop	dword ptr [_reg86+28]
	pop	dword ptr [_reg86+32]
	pop	dword ptr [_reg86+36]
	lgdt	fword ptr [_gdt+1*8]
	jmp	csinit
csinit_ SEGMENT AT 48
	csinit LABEL FAR
csinit_ ENDS
	mov	eax, 3*8
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ss, ax
	xchg	esp, _mon_sp
	lidt	fword ptr [_gdt+2*8]

	pop	eax
	out	021h, al
	mov	al, ah
	out	0A1h, al

_6:
	add	_lost_ticks, ecx

	popf
	pop	ebx
	pop	edi
	pop	esi
	pop	ebp
	ret

_exit:
__exit:
___exit:
	sti
	jmp	___exit

___main:
	ret

_phys_insw:
	push	ebp
	mov	ebp, esp
	cld
	push	edi
	push	es

	mov	ecx, 33
	mov	es, cx
	mov	edx, 8[ebp]
	mov	edi, 12[ebp]
	mov	ecx, 16[ebp]
	shr	ecx, 1
	rep insw
	pop	es
	pop	edi
	pop	ebp
	ret

_phys_insb:
	push	ebp
	mov	ebp, esp
	cld
	push	edi
	push	es

	mov	ecx, 33
	mov	es, cx
	mov	edx, 8[ebp]
	mov	edi, 12[ebp]
	mov	ecx, 16[ebp]
	rep insb
	pop	es
	pop	edi
	pop	ebp
	ret

_phys_outsw:
	push	ebp
	mov	ebp, esp
	cld
	push	esi
	push	ds

	mov	ecx, 33
	mov	ds, cx
	mov	edx, 8[ebp]
	mov	esi, 12[ebp]
	mov	ecx, 16[ebp]
	shr	ecx, 1
	rep outsw
	pop	ds
	pop	esi
	pop	ebp
	ret

_phys_outsb:
	push	ebp
	mov	ebp, esp
	cld
	push	esi
	push	ds

	mov	ecx, 33
	mov	ds, cx
	mov	edx, 8[ebp]
	mov	esi, 12[ebp]
	mov	ecx, 16[ebp]
	rep outsb
	pop	ds
	pop	esi
	pop	ebp
	ret
	PC_ARGS = 4+4+4+4

_phys_copy:
	cld
	push	esi
	push	edi
	push	es

	mov	eax, 33
	mov	es, ax

	mov	esi, PC_ARGS[esp]
	mov	edi, PC_ARGS+4[esp]
	mov	eax, PC_ARGS+4+4[esp]

	cmp	eax, 10
	jb	pc_small
	mov	ecx, esi
	neg	ecx
	and	ecx, 3
	sub	eax, ecx

	rep movs byte ptr es:[edi], byte ptr es:[esi]
	mov	ecx, eax
	shr	ecx, 2

	rep movs dword ptr es:[edi], dword ptr es:[esi]
	and	eax, 3
pc_small:
	xchg	ecx, eax

	rep movs byte ptr es:[edi], byte ptr es:[esi]

	mov	eax, 0
_phys_copy_fault:
	pop	es
	pop	edi
	pop	esi
	ret

_phys_copy_fault_in_kernel:
	pop	es
	pop	edi
	pop	esi
	mov	eax, cr2
	ret

_phys_memset:
	push	ebp
	mov	ebp, esp
	push	esi
	push	ebx
	push	ds

	mov	esi, 8[ebp]
	mov	eax, 16[ebp]
	mov	ebx, 33
	mov	ds, bx
	mov	ebx, 12[ebp]
	shr	eax, 2
fill_start:
	mov	[esi], ebx
	add	esi, 4
	dec	eax
	jne	fill_start

	mov	eax, 16[ebp]
	and	eax, 3
remain_fill:
	cmp	eax, 0
	je	fill_done
	mov	bl, 12[ebp]
	mov	[esi], bl
	add	esi, 1
	inc	ebp
	dec	eax
	jmp	remain_fill
	
fill_done:
	pop	ds
	pop	ebx
	pop	esi
	pop	ebp
	ret

_mem_rdw:
	mov	cx, ds
	mov	ds, 4[esp]
	mov	eax, 4+4[esp]
	movzx	eax, word ptr [eax]
	mov	ds, cx
	ret

_reset:
	lidt	fword ptr [idt_zero]
	int	3

.DATA
idt_zero DWORD 0, 0

.CODE
_halt_cpu:
	sti
	hlt
	cli
	ret

_level0:
	mov	ax, cs
	cmp	ax, 6*8
	jne	_1

	mov	eax, 4[esp]
	call	eax
	ret

_1:
	mov	eax, 4[esp]
	int	34
	ret


_read_cpu_flags:
	pushf
	mov	eax, [esp]
	add	esp, 4
	ret

_read_ds:
	mov	eax, 0
	mov	ax, ds
	ret

_read_cs:
	mov	eax, 0
	mov	ax, cs
	ret

_read_ss:
	mov	eax, 0
	mov	ax, ss
	ret


_fninit:
	db 0DBh, 0E3h

	ret

_fnstsw:
	xor	eax, eax

	db 0DFh, 0E0h

	ret

_fnstcw:
	push	eax
	mov	eax, 8[esp]


	db 0D9h, 038h

	pop	eax
	ret


_read_cr0:
	push	ebp
	mov	ebp, esp
	mov	eax, cr0
	pop	ebp
	ret


_write_cr0:
	push	ebp
	mov	ebp, esp
	mov	eax, 8[ebp]
	mov	cr0, eax
	jmp	_2
_2:
	pop	ebp
	ret


_read_cr2:
	mov	eax, cr2
	ret


_read_cr4:
	push	ebp
	mov	ebp, esp

	db  00fh, 020h, 0e0h

	pop	ebp
	ret


_write_cr4:
	push	ebp
	mov	ebp, esp
	mov	eax, 8[ebp]

	db  00fh, 022h, 0e0h

	jmp	_3
_3:
	pop	ebp
	ret


_getcr3val:
	mov	eax, cr3
	mov	_thecr3, eax
	ret


PUBLIC	_ia32_msr_read
_ia32_msr_read:
	push	ebp
	mov	ebp, esp

	mov	ecx, 8[ebp]
	db 00fh, 032h

	mov	ecx, 12[ebp]
	mov	[ecx], edx
	mov	ecx, 16[ebp]
	mov	[ecx], eax

	pop	ebp
	ret


PUBLIC	_ia32_msr_write
_ia32_msr_write:
	push	ebp
	mov	ebp, esp

	mov	edx, 12[ebp]
	mov	eax, 16[ebp]
	mov	ecx, 8[ebp]
	
	db 00fh, 030h
	db 00fh, 030h

	pop	ebp
	ret


_idt_reload:
	lidt	fword ptr [_gdt+2*8]
	ret

PUBLIC	_reload_ds
_reload_ds:
	mov	ax, ds
	mov	ds, ax
	ret

END
