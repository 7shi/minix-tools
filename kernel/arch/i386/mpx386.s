; This file, mpx386.s, is included by mpx.s when Minix is compiled for  
; 32-bit Intel CPUs. The alternative mpx88.s is compiled for 16-bit CPUs. 
;
; This file is part of the lowest layer of the MINIX kernel.  (The other part 
; is "proc.c".)  The lowest layer does process switching and message handling. 
; Furthermore it contains the assembler startup code for Minix and the 32-bit 
; interrupt handlers.  It cooperates with the code in "start.c" to set up a  
; good environment for main(). 
;
; Every transition to the kernel goes through this file.  Transitions to the  
; kernel may be nested.  The initial entry may be with a system call (i.e.,  
; send or receive a message), an exception or a hardware interrupt;  kernel  
; reentries may only be made by hardware interrupts.  The count of reentries  
; is kept in "k_reenter". It is important for deciding whether to switch to  
; the kernel stack and for protecting the message passing code in "proc.c". 
;
; For the message passing trap, most of the machine state is saved in the 
; proc table.  (Some of the registers need not be saved.)  Then the stack is 
; switched to "k_stack", and interrupts are reenabled.  Finally, the system 
; call handler (in C) is called.  When it returns, interrupts are disabled 
; again and the code falls into the restart routine, to finish off held-up 
; interrupts and run the process or task whose pointer is in "proc_ptr". 
;
; Hardware interrupt handlers do the same, except  (1) The entire state must 
; be saved.  (2) There are too many handlers to do this inline, so the save 
; routine is called.  A few cycles are saved by pushing the address of the 
; appropiate restart routine for a return later.  (3) A stack switch is 
; avoided when the stack is already switched.  (4) The (master) 8259 interrupt 
; controller is reenabled centrally in save().  (5) Each interrupt handler 
; masks its interrupt line using the 8259 before enabling (other unmasked) 
; interrupts, and unmasks it after servicing the interrupt.  This limits the 
; nest level to the number of lines and protects the handler from itself. 
;
; For communication with the boot monitor at startup time some constant 
; data are compiled into the beginning of the text segment. This facilitates  
; reading the data at the start of the boot process, since only the first 
; sector of the file needs to be read. 
;
; Some data storage is also allocated at the end of this file. This data  
; will be at the start of the data segment of the kernel and will be read 
; and modified by the boot monitor before the kernel starts.

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

PUBLIC	_restart
PUBLIC	_reload_cr3
PUBLIC	_write_cr3

PUBLIC	_divide_error
PUBLIC	_single_step_exception
PUBLIC	_nmi
PUBLIC	_breakpoint_exception
PUBLIC	_overflow
PUBLIC	_bounds_check
PUBLIC	_inval_opcode
PUBLIC	_copr_not_available
PUBLIC	_double_fault
PUBLIC	_copr_seg_overrun
PUBLIC	_inval_tss
PUBLIC	_segment_not_present
PUBLIC	_stack_exception
PUBLIC	_general_protection
PUBLIC	_page_fault
PUBLIC	_copr_error
PUBLIC	_alignment_check
PUBLIC	_machine_check
PUBLIC	_simd_exception
EXTERN	_params_size:DWORD
EXTERN	_params_offset:DWORD
EXTERN	_mon_ds:DWORD
EXTERN	_schedcheck:NEAR
EXTERN	_dirtypde:DWORD
PUBLIC	_lazy_fpu

PUBLIC	_hwint00
PUBLIC	_hwint01
PUBLIC	_hwint02
PUBLIC	_hwint03
PUBLIC	_hwint04
PUBLIC	_hwint05
PUBLIC	_hwint06
PUBLIC	_hwint07
PUBLIC	_hwint08
PUBLIC	_hwint09
PUBLIC	_hwint10
PUBLIC	_hwint11
PUBLIC	_hwint12
PUBLIC	_hwint13
PUBLIC	_hwint14
PUBLIC	_hwint15

PUBLIC	_level0_call

EXTERN __brksize:DWORD, _etext:DWORD, _end:DWORD
EXTERN _main:NEAR, _irq_handle:NEAR, _sys_call:NEAR, _minix_panic:NEAR
EXTERN _exception_handler:NEAR, _nmi_watchdog_handler:NEAR, _cstart:NEAR
EXTERN _gdt:NEAR, _aout:DWORD
EXTERN _mon_return:DWORD, _mon_sp:DWORD
EXTERN _osfxsr_feature:DWORD, _fpu_presence:DWORD, _ptproc:DWORD

PUBLIC	_MINIX
_MINIX:
	; hard coded by pe2aout
	mov __brksize, eax
	mov _etext, ebx
	mov _end, ecx
	mov [ebx], dx

	movzx	esp, sp
	push	ebp
	mov	ebp, esp
	push	esi
	push	edi
	cmp	dword ptr [ebp+4], 0
	je	noret
	inc	_mon_return
noret:
	mov	_mon_sp, esp

	sgdt	fword ptr [_gdt+8]
	mov	esi, dword ptr [_gdt+10]
	mov	ebx, _gdt
	mov	ecx, 64
copygdt:
	mov	al, es:[esi]
	mov	[ebx], al
	inc	esi
	inc	ebx
	loop	copygdt
	mov	eax, dword ptr [_gdt+26]
	and	eax, 00FFFFFFh
	add	eax, _gdt
	mov	dword ptr [_gdt+10], eax
	lgdt	fword ptr [_gdt+8]

	mov	ebx, 8[ebp]
	mov	edx, 12[ebp]
	mov	eax, 16[ebp]
	mov	_aout, eax
	mov	ax, ds
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ss, ax
	mov esp, offset _k_boot_stktop

	mov	_params_size, edx
	mov	_params_offset, ebx
	mov	_mon_ds, 40

	push	edx
	push	ebx
	push	40
	push	24
	push	48
	call	_cstart
	add	esp, 20

	lgdt	fword ptr [_gdt+8]
	lidt	fword ptr [_gdt+16]

	jmp	csinit

csinit_ SEGMENT AT 48
	csinit LABEL FAR
csinit_ ENDS
	mov	ax, 24
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	mov	gs, ax
	mov	ss, ax
	mov	ax, 80
	ltr	ax
	push	0
	popf
	jmp	_main

;===========================================================================
;									hwint00 - 07
;===========================================================================
; Note this is a macro, it just looks like a subroutine.

hwint_master MACRO irq
	LOCAL _0
	cmp	dword ptr [esp+4], 48
	je	_0
	push	ebp
	mov	ebp, 24[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 0[esp]
	mov	PCREG[ebp], esi
	mov	esi, 4[esp]
	mov	CSREG[ebp], esi
	mov	esi, 8[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 12[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 16[esp]
	mov	SSREG[ebp], esi
	push	ebp
	call	_lazy_fpu
	add	esp, 4
	mov	ebp, 0
	push	irq
	call	_irq_handle
	add	esp, 4
	mov	al, 20h
	out	20h, al
	jmp	_restart
_0:
	pushad
	push	irq
	call	_irq_handle
	add	esp, 4
	mov	al, 20h
	out	20h, al
	popad
	iret
ENDM

; Each of these entry points is an expansion of the hwint_master macro
_hwint00: hwint_master(0) ; Interrupt routine for irq 0 (the clock)
_hwint01: hwint_master(1) ; Interrupt routine for irq 1 (keyboard)
_hwint02: hwint_master(2) ; Interrupt routine for irq 2 (cascade!)
_hwint03: hwint_master(3) ; Interrupt routine for irq 3 (second serial)
_hwint04: hwint_master(4) ; Interrupt routine for irq 4 (first serial)
_hwint05: hwint_master(5) ; Interrupt routine for irq 5 (XT winchester)
_hwint06: hwint_master(6) ; Interrupt routine for irq 6 (floppy)
_hwint07: hwint_master(7) ; Interrupt routine for irq 7 (printer)

;===========================================================================
;									hwint08 - 15
;===========================================================================

hwint_slave MACRO irq
	LOCAL _0
	cmp	dword ptr [esp+4], 48
	je	_0
	push	ebp
	mov	ebp, 24[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 0[esp]
	mov	PCREG[ebp], esi
	mov	esi, 4[esp]
	mov	CSREG[ebp], esi
	mov	esi, 8[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 12[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 16[esp]
	mov	SSREG[ebp], esi
	push	ebp
	call	_lazy_fpu
	add	esp, 4
	mov	ebp, 0
	push	irq
	call	_irq_handle
	add	esp, 4
	mov	al, 020h
	out	020h, al
	out	0A0h, al
	jmp	_restart
_0:
	pushad
	push	irq
	call	_irq_handle
	add	esp, 4
	mov	al, 020h
	out	020h, al
	out	0A0h, al
	popad
	iret
ENDM

_hwint08: hwint_slave( 8) ; Interrupt routine for irq 8 (realtime clock)
_hwint09: hwint_slave( 9) ; Interrupt routine for irq 9 (irq 2 redirected)
_hwint10: hwint_slave(10) ; Interrupt routine for irq 10
_hwint11: hwint_slave(11) ; Interrupt routine for irq 11
_hwint12: hwint_slave(12) ; Interrupt routine for irq 12
_hwint13: hwint_slave(13) ; Interrupt routine for irq 13 (FPU exception)
_hwint14: hwint_slave(14) ; Interrupt routine for irq 14 (AT winchester)
_hwint15: hwint_slave(15) ; Interrupt routine for irq 15

; syscall is only from a process to kernel

PUBLIC	_syscall_entry
_syscall_entry:
	push	ebp
	mov	ebp, 24[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 0[esp]
	mov	PCREG[ebp], esi
	mov	esi, 4[esp]
	mov	CSREG[ebp], esi
	mov	esi, 8[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 12[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 16[esp]
	mov	SSREG[ebp], esi
	push	ebp
	call	_lazy_fpu
	add	esp, 4

	push	ebp
	push	edx
	push	ebx
	push	eax
	push	ecx
	mov	ebp, 0
	call	_sys_call

	add	esp, 16
	pop	esi
	mov	AXREG[esi], eax
	jmp	_restart

exception_entry:
	cmp	dword ptr 12[esp], 48
	je	exception_entry_nested

exception_entry_from_user:
	cld
	push	ebp
	mov	ebp, 32[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 8[esp]
	mov	PCREG[ebp], esi
	mov	esi, 12[esp]
	mov	CSREG[ebp], esi
	mov	esi, 16[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 20[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 24[esp]
	mov	SSREG[ebp], esi
	push	ebp
	call	_lazy_fpu
	add	esp, 4
	mov	ebp, 0
	push	esp
	push	0
	call	_exception_handler

	jmp	_restart

exception_entry_nested:
	pushad
	mov	eax, esp
	add	eax, DS:[32]
	push	eax
	push	1
	call	_exception_handler
	add	esp, 8
	popad

	add	esp, 8
	iret

_restart:
	call	_schedcheck
	mov	ebp, eax
	cmp	dword ptr P_CR3[ebp], 0
	je	_0
	mov	eax, P_CR3[ebp]
	mov	ecx, cr3
	cmp	eax, ecx
	je	_0
	mov	cr3, eax
	mov	_ptproc, ebp
	mov	_dirtypde, 0
_0:
	mov	eax, SSREG[ebp]
	push	eax
	mov	eax, SPREG[ebp]
	push	eax
	mov	eax, PSWREG[ebp]
	push	eax
	mov	eax, CSREG[ebp]
	push	eax
	mov	eax, PCREG[ebp]
	push	eax

	mov	eax, ss:AXREG[ebp]
	mov	ecx, ss:CXREG[ebp]
	mov	edx, ss:DXREG[ebp]
	mov	ebx, ss:BXREG[ebp]
	mov	esi, ss:SIREG[ebp]
	mov	edi, ss:DIREG[ebp]

	lldt	word ptr P_LDT_SEL[ebp]
	mov	ds, ss:DSREG[ebp]
	mov	es, ss:ESREG[ebp]
	mov	fs, ss:FSREG[ebp]
	mov	gs, ss:GSREG[ebp]

	mov	ebp, ss:BPREG[ebp]

	iret

_divide_error:
	push	0
	push	0
	jmp	exception_entry

_single_step_exception:
	push	0
	push	1
	jmp	exception_entry

_nmi:
	push	ds
	push	es
	push	fs
	push	gs
	pushad

	mov	si, ss
	mov	ds, si
	mov	es, si

	push	esp
	call	_nmi_watchdog_handler
	add	esp, 4

	popad
	pop	gs
	pop	fs
	pop	es
	pop	ds

	iret

_breakpoint_exception:
	push	0
	push	3
	jmp	exception_entry

_overflow:
	push	0
	push	4
	jmp	exception_entry

_bounds_check:
	push	0
	push	5
	jmp	exception_entry

_inval_opcode:
	push	0
	push	6
	jmp	exception_entry

_copr_not_available:
	cmp	dword ptr 4[esp], 48
	je	copr_not_available_in_kernel
	clts
	cld
	push	ebp
	mov	ebp, 24[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 0[esp]
	mov	PCREG[ebp], esi
	mov	esi, 4[esp]
	mov	CSREG[ebp], esi
	mov	esi, 8[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 12[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 16[esp]
	mov	SSREG[ebp], esi
	lea	ebx, P_MISC_FLAGS[ebp]
	mov	cx, [ebx]
	and	cx, 1000h
	jne	_1
	or	word ptr [ebx], 1000h
	db 0DBh, 0E3h

	jmp	copr_return
_1:
	mov	eax, ss:FP_SAVE_AREA_P[ebp]
	cmp	_osfxsr_feature, 0
	je	fp_l_no_fxsr

	db 0Fh, 0AEh, 08h

	jmp	copr_return
fp_l_no_fxsr:

	db 0DDh, 020h

copr_return:
	or	word ptr [ebx], 0800h
	jmp	_restart

copr_not_available_in_kernel:
	mov	dword ptr 4[esp], 08000h
	mov	dword ptr [esp], 0
	call	_minix_panic

_double_fault:
	push	8
	jmp	exception_entry

_copr_seg_overrun:
	push	0
	push	9
	jmp	exception_entry

_inval_tss:
	push	10
	jmp	exception_entry

_segment_not_present:
	push	11
	jmp	exception_entry

_stack_exception:
	push	12
	jmp	exception_entry

_general_protection:
	push	13
	jmp	exception_entry

_page_fault:
	push	14
	jmp	exception_entry

_copr_error:
	push	0
	push	16
	jmp	exception_entry

_alignment_check:
	push	0
	push	17
	jmp	exception_entry

_machine_check:
	push	0
	push	18
	jmp	exception_entry

_simd_exception:
	push	0
	push	19
	jmp	exception_entry


_lazy_fpu:
	push	ebp
	mov	ebp, esp
	push	eax
	push	ebx
	push	ecx
	cmp	_fpu_presence, 0
	je	no_fpu_available
	mov	eax, 8[ebp]
	lea	ebx, P_MISC_FLAGS[eax]
	mov	cx, [ebx]
	and	cx, 0800h
	je	_2
	mov	eax, ss:FP_SAVE_AREA_P[eax]
	cmp	_osfxsr_feature, 0
	je	fp_s_no_fxsr

	db 00Fh, 0AEh, 000h
	db 0DBh, 0E3h

	jmp	fp_saved
fp_s_no_fxsr:

	db 0DDh, 030h
	db 09Bh

fp_saved:
	and	word ptr [ebx], 0f7ffh
_2:
	mov	eax, cr0
	or	eax, 8
	mov	cr0, eax
no_fpu_available:
	pop	ecx
	pop	ebx
	pop	eax
	pop	ebp
	ret


_write_cr3:
	push	ebp
	mov	ebp, esp
	mov	eax, 8[ebp]
	mov	ecx, cr3
	cmp	eax, ecx
	je	_3
	mov	cr3, eax
	mov	_dirtypde, 0
_3:
	pop	ebp
	ret


_level0_call:
	push	ebp
	mov	ebp, 24[esp]
	mov	ss:DSREG[ebp], ds
	mov	ss:ESREG[ebp], es
	mov	ss:FSREG[ebp], fs
	mov	ss:GSREG[ebp], gs
	mov	ss:AXREG[ebp], eax
	mov	ss:CXREG[ebp], ecx
	mov	ss:DXREG[ebp], edx
	mov	ss:BXREG[ebp], ebx
	mov	ss:SIREG[ebp], esi
	mov	ss:DIREG[ebp], edi
	pop	esi
	mov	ss:BPREG[ebp], esi
	mov	si, ss
	mov	ds, si
	mov	es, si
	mov	si, 0
	mov	gs, si
	mov	fs, si
	mov	esi, 0[esp]
	mov	PCREG[ebp], esi
	mov	esi, 4[esp]
	mov	CSREG[ebp], esi
	mov	esi, 8[esp]
	mov	PSWREG[ebp], esi
	mov	esi, 12[esp]
	mov	SPREG[ebp], esi
	mov	STREG[ebp], esi
	mov	esi, 16[esp]
	mov	SSREG[ebp], esi
	push	ebp
	call	_lazy_fpu
	add	esp, 4
	mov	ebp, 0
	call	eax
	jmp	_restart

_reload_cr3:
	push	ebp
	mov	ebp, esp
	mov	_dirtypde, 0
	mov	eax, cr3
	mov	cr3, eax
	pop	ebp
	ret

.DATA?
k_boot_stack BYTE 4096 DUP(?)
COMM _k_boot_stktop:DWORD

END
