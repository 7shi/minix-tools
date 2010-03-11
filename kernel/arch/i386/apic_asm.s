.386
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

PUBLIC	_apic_hwint00
PUBLIC	_apic_hwint01
PUBLIC	_apic_hwint02
PUBLIC	_apic_hwint03
PUBLIC	_apic_hwint04
PUBLIC	_apic_hwint05
PUBLIC	_apic_hwint06
PUBLIC	_apic_hwint07
PUBLIC	_apic_hwint08
PUBLIC	_apic_hwint09
PUBLIC	_apic_hwint10
PUBLIC	_apic_hwint11
PUBLIC	_apic_hwint12
PUBLIC	_apic_hwint13
PUBLIC	_apic_hwint14
PUBLIC	_apic_hwint15

;===========================================================================
;							interrupt handlers							    
;			interrupt handlers for 386 32-bit protected mode			    
;			APIC interrupt handlers for 386 32-bit protected mode			
;===========================================================================
EXTERN _lazy_fpu:NEAR, _irq_handle:NEAR, _lapic_eoi_addr:DWORD, _restart:NEAR
apic_hwint MACRO irq
	LOCAL _0
	cmp	dword ptr[esp+4], 48
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
	mov	esi, [esp]
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
	mov	eax, [_lapic_eoi_addr]
	mov	dword ptr[eax], 0
	jmp	_restart
_0:
	pushad
	push	irq
	call	_irq_handle
	add	esp, 4
	mov	eax, _lapic_eoi_addr
	mov	dword ptr[eax], 0
	popad
	iret
ENDM

; Each of these entry points is an expansion of the hwint_master macro
_apic_hwint00: apic_hwint(0)
_apic_hwint01: apic_hwint(1)
_apic_hwint02: apic_hwint(2)
_apic_hwint03: apic_hwint(3)
_apic_hwint04: apic_hwint(4)
_apic_hwint05: apic_hwint(5)
_apic_hwint06: apic_hwint(6)
_apic_hwint07: apic_hwint(7)
_apic_hwint08: apic_hwint(8)
_apic_hwint09: apic_hwint(9)
_apic_hwint10: apic_hwint(10)
_apic_hwint11: apic_hwint(11)
_apic_hwint12: apic_hwint(12)
_apic_hwint13: apic_hwint(13)
_apic_hwint14: apic_hwint(14)
_apic_hwint15: apic_hwint(15)

lapic_intr MACRO func
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
	mov	eax, func
	call	eax
	mov	eax, _lapic_eoi_addr
	mov	dword ptr [eax], 0
	jmp	_restart
_0:
	pushad
	mov	eax, func
	call	eax
	mov	eax, _lapic_eoi_addr
	mov	dword ptr [eax], 0
	popad
	iret
ENDM

EXTERN _bsp_timer_int_handler:NEAR
PUBLIC	_lapic_bsp_timer_int_handler
_lapic_bsp_timer_int_handler:
	lapic_intr(_bsp_timer_int_handler)

EXTERN _ap_timer_int_handler:NEAR
PUBLIC	_lapic_ap_timer_int_handler
_lapic_ap_timer_int_handler:
	lapic_intr(_ap_timer_int_handler)

.DATA
lapic_intr_dummy_handler_msg db 'UNHABLED APIC interrupt vector %d', 10, 0

.CODE

EXTERN _kprintf:NEAR

LAPIC_INTR_HANDLER MACRO vect
	LOCAL _1
	push vect
	push offset lapic_intr_dummy_handler_msg
	call _kprintf
_1:
ENDM

PUBLIC	_lapic_intr_dummy_handles_start
_lapic_intr_dummy_handles_start:

lapic_intr_dummy_handler_0: LAPIC_INTR_HANDLER(0)
lapic_intr_dummy_handler_1: LAPIC_INTR_HANDLER(1)
lapic_intr_dummy_handler_2: LAPIC_INTR_HANDLER(2)
lapic_intr_dummy_handler_3: LAPIC_INTR_HANDLER(3)
lapic_intr_dummy_handler_4: LAPIC_INTR_HANDLER(4)
lapic_intr_dummy_handler_5: LAPIC_INTR_HANDLER(5)
lapic_intr_dummy_handler_6: LAPIC_INTR_HANDLER(6)
lapic_intr_dummy_handler_7: LAPIC_INTR_HANDLER(7)
lapic_intr_dummy_handler_8: LAPIC_INTR_HANDLER(8)
lapic_intr_dummy_handler_9: LAPIC_INTR_HANDLER(9)
lapic_intr_dummy_handler_10: LAPIC_INTR_HANDLER(10)
lapic_intr_dummy_handler_11: LAPIC_INTR_HANDLER(11)
lapic_intr_dummy_handler_12: LAPIC_INTR_HANDLER(12)
lapic_intr_dummy_handler_13: LAPIC_INTR_HANDLER(13)
lapic_intr_dummy_handler_14: LAPIC_INTR_HANDLER(14)
lapic_intr_dummy_handler_15: LAPIC_INTR_HANDLER(15)
lapic_intr_dummy_handler_16: LAPIC_INTR_HANDLER(16)
lapic_intr_dummy_handler_17: LAPIC_INTR_HANDLER(17)
lapic_intr_dummy_handler_18: LAPIC_INTR_HANDLER(18)
lapic_intr_dummy_handler_19: LAPIC_INTR_HANDLER(19)
lapic_intr_dummy_handler_20: LAPIC_INTR_HANDLER(20)
lapic_intr_dummy_handler_21: LAPIC_INTR_HANDLER(21)
lapic_intr_dummy_handler_22: LAPIC_INTR_HANDLER(22)
lapic_intr_dummy_handler_23: LAPIC_INTR_HANDLER(23)
lapic_intr_dummy_handler_24: LAPIC_INTR_HANDLER(24)
lapic_intr_dummy_handler_25: LAPIC_INTR_HANDLER(25)
lapic_intr_dummy_handler_26: LAPIC_INTR_HANDLER(26)
lapic_intr_dummy_handler_27: LAPIC_INTR_HANDLER(27)
lapic_intr_dummy_handler_28: LAPIC_INTR_HANDLER(28)
lapic_intr_dummy_handler_29: LAPIC_INTR_HANDLER(29)
lapic_intr_dummy_handler_30: LAPIC_INTR_HANDLER(30)
lapic_intr_dummy_handler_31: LAPIC_INTR_HANDLER(31)
lapic_intr_dummy_handler_32: LAPIC_INTR_HANDLER(32)
lapic_intr_dummy_handler_33: LAPIC_INTR_HANDLER(33)
lapic_intr_dummy_handler_34: LAPIC_INTR_HANDLER(34)
lapic_intr_dummy_handler_35: LAPIC_INTR_HANDLER(35)
lapic_intr_dummy_handler_36: LAPIC_INTR_HANDLER(36)
lapic_intr_dummy_handler_37: LAPIC_INTR_HANDLER(37)
lapic_intr_dummy_handler_38: LAPIC_INTR_HANDLER(38)
lapic_intr_dummy_handler_39: LAPIC_INTR_HANDLER(39)
lapic_intr_dummy_handler_40: LAPIC_INTR_HANDLER(40)
lapic_intr_dummy_handler_41: LAPIC_INTR_HANDLER(41)
lapic_intr_dummy_handler_42: LAPIC_INTR_HANDLER(42)
lapic_intr_dummy_handler_43: LAPIC_INTR_HANDLER(43)
lapic_intr_dummy_handler_44: LAPIC_INTR_HANDLER(44)
lapic_intr_dummy_handler_45: LAPIC_INTR_HANDLER(45)
lapic_intr_dummy_handler_46: LAPIC_INTR_HANDLER(46)
lapic_intr_dummy_handler_47: LAPIC_INTR_HANDLER(47)
lapic_intr_dummy_handler_48: LAPIC_INTR_HANDLER(48)
lapic_intr_dummy_handler_49: LAPIC_INTR_HANDLER(49)
lapic_intr_dummy_handler_50: LAPIC_INTR_HANDLER(50)
lapic_intr_dummy_handler_51: LAPIC_INTR_HANDLER(51)
lapic_intr_dummy_handler_52: LAPIC_INTR_HANDLER(52)
lapic_intr_dummy_handler_53: LAPIC_INTR_HANDLER(53)
lapic_intr_dummy_handler_54: LAPIC_INTR_HANDLER(54)
lapic_intr_dummy_handler_55: LAPIC_INTR_HANDLER(55)
lapic_intr_dummy_handler_56: LAPIC_INTR_HANDLER(56)
lapic_intr_dummy_handler_57: LAPIC_INTR_HANDLER(57)
lapic_intr_dummy_handler_58: LAPIC_INTR_HANDLER(58)
lapic_intr_dummy_handler_59: LAPIC_INTR_HANDLER(59)
lapic_intr_dummy_handler_60: LAPIC_INTR_HANDLER(60)
lapic_intr_dummy_handler_61: LAPIC_INTR_HANDLER(61)
lapic_intr_dummy_handler_62: LAPIC_INTR_HANDLER(62)
lapic_intr_dummy_handler_63: LAPIC_INTR_HANDLER(63)
lapic_intr_dummy_handler_64: LAPIC_INTR_HANDLER(64)
lapic_intr_dummy_handler_65: LAPIC_INTR_HANDLER(65)
lapic_intr_dummy_handler_66: LAPIC_INTR_HANDLER(66)
lapic_intr_dummy_handler_67: LAPIC_INTR_HANDLER(67)
lapic_intr_dummy_handler_68: LAPIC_INTR_HANDLER(68)
lapic_intr_dummy_handler_69: LAPIC_INTR_HANDLER(69)
lapic_intr_dummy_handler_70: LAPIC_INTR_HANDLER(70)
lapic_intr_dummy_handler_71: LAPIC_INTR_HANDLER(71)
lapic_intr_dummy_handler_72: LAPIC_INTR_HANDLER(72)
lapic_intr_dummy_handler_73: LAPIC_INTR_HANDLER(73)
lapic_intr_dummy_handler_74: LAPIC_INTR_HANDLER(74)
lapic_intr_dummy_handler_75: LAPIC_INTR_HANDLER(75)
lapic_intr_dummy_handler_76: LAPIC_INTR_HANDLER(76)
lapic_intr_dummy_handler_77: LAPIC_INTR_HANDLER(77)
lapic_intr_dummy_handler_78: LAPIC_INTR_HANDLER(78)
lapic_intr_dummy_handler_79: LAPIC_INTR_HANDLER(79)
lapic_intr_dummy_handler_80: LAPIC_INTR_HANDLER(80)
lapic_intr_dummy_handler_81: LAPIC_INTR_HANDLER(81)
lapic_intr_dummy_handler_82: LAPIC_INTR_HANDLER(82)
lapic_intr_dummy_handler_83: LAPIC_INTR_HANDLER(83)
lapic_intr_dummy_handler_84: LAPIC_INTR_HANDLER(84)
lapic_intr_dummy_handler_85: LAPIC_INTR_HANDLER(85)
lapic_intr_dummy_handler_86: LAPIC_INTR_HANDLER(86)
lapic_intr_dummy_handler_87: LAPIC_INTR_HANDLER(87)
lapic_intr_dummy_handler_88: LAPIC_INTR_HANDLER(88)
lapic_intr_dummy_handler_89: LAPIC_INTR_HANDLER(89)
lapic_intr_dummy_handler_90: LAPIC_INTR_HANDLER(90)
lapic_intr_dummy_handler_91: LAPIC_INTR_HANDLER(91)
lapic_intr_dummy_handler_92: LAPIC_INTR_HANDLER(92)
lapic_intr_dummy_handler_93: LAPIC_INTR_HANDLER(93)
lapic_intr_dummy_handler_94: LAPIC_INTR_HANDLER(94)
lapic_intr_dummy_handler_95: LAPIC_INTR_HANDLER(95)
lapic_intr_dummy_handler_96: LAPIC_INTR_HANDLER(96)
lapic_intr_dummy_handler_97: LAPIC_INTR_HANDLER(97)
lapic_intr_dummy_handler_98: LAPIC_INTR_HANDLER(98)
lapic_intr_dummy_handler_99: LAPIC_INTR_HANDLER(99)
lapic_intr_dummy_handler_100: LAPIC_INTR_HANDLER(100)
lapic_intr_dummy_handler_101: LAPIC_INTR_HANDLER(101)
lapic_intr_dummy_handler_102: LAPIC_INTR_HANDLER(102)
lapic_intr_dummy_handler_103: LAPIC_INTR_HANDLER(103)
lapic_intr_dummy_handler_104: LAPIC_INTR_HANDLER(104)
lapic_intr_dummy_handler_105: LAPIC_INTR_HANDLER(105)
lapic_intr_dummy_handler_106: LAPIC_INTR_HANDLER(106)
lapic_intr_dummy_handler_107: LAPIC_INTR_HANDLER(107)
lapic_intr_dummy_handler_108: LAPIC_INTR_HANDLER(108)
lapic_intr_dummy_handler_109: LAPIC_INTR_HANDLER(109)
lapic_intr_dummy_handler_110: LAPIC_INTR_HANDLER(110)
lapic_intr_dummy_handler_111: LAPIC_INTR_HANDLER(111)
lapic_intr_dummy_handler_112: LAPIC_INTR_HANDLER(112)
lapic_intr_dummy_handler_113: LAPIC_INTR_HANDLER(113)
lapic_intr_dummy_handler_114: LAPIC_INTR_HANDLER(114)
lapic_intr_dummy_handler_115: LAPIC_INTR_HANDLER(115)
lapic_intr_dummy_handler_116: LAPIC_INTR_HANDLER(116)
lapic_intr_dummy_handler_117: LAPIC_INTR_HANDLER(117)
lapic_intr_dummy_handler_118: LAPIC_INTR_HANDLER(118)
lapic_intr_dummy_handler_119: LAPIC_INTR_HANDLER(119)
lapic_intr_dummy_handler_120: LAPIC_INTR_HANDLER(120)
lapic_intr_dummy_handler_121: LAPIC_INTR_HANDLER(121)
lapic_intr_dummy_handler_122: LAPIC_INTR_HANDLER(122)
lapic_intr_dummy_handler_123: LAPIC_INTR_HANDLER(123)
lapic_intr_dummy_handler_124: LAPIC_INTR_HANDLER(124)
lapic_intr_dummy_handler_125: LAPIC_INTR_HANDLER(125)
lapic_intr_dummy_handler_126: LAPIC_INTR_HANDLER(126)
lapic_intr_dummy_handler_127: LAPIC_INTR_HANDLER(127)
lapic_intr_dummy_handler_128: LAPIC_INTR_HANDLER(128)
lapic_intr_dummy_handler_129: LAPIC_INTR_HANDLER(129)
lapic_intr_dummy_handler_130: LAPIC_INTR_HANDLER(130)
lapic_intr_dummy_handler_131: LAPIC_INTR_HANDLER(131)
lapic_intr_dummy_handler_132: LAPIC_INTR_HANDLER(132)
lapic_intr_dummy_handler_133: LAPIC_INTR_HANDLER(133)
lapic_intr_dummy_handler_134: LAPIC_INTR_HANDLER(134)
lapic_intr_dummy_handler_135: LAPIC_INTR_HANDLER(135)
lapic_intr_dummy_handler_136: LAPIC_INTR_HANDLER(136)
lapic_intr_dummy_handler_137: LAPIC_INTR_HANDLER(137)
lapic_intr_dummy_handler_138: LAPIC_INTR_HANDLER(138)
lapic_intr_dummy_handler_139: LAPIC_INTR_HANDLER(139)
lapic_intr_dummy_handler_140: LAPIC_INTR_HANDLER(140)
lapic_intr_dummy_handler_141: LAPIC_INTR_HANDLER(141)
lapic_intr_dummy_handler_142: LAPIC_INTR_HANDLER(142)
lapic_intr_dummy_handler_143: LAPIC_INTR_HANDLER(143)
lapic_intr_dummy_handler_144: LAPIC_INTR_HANDLER(144)
lapic_intr_dummy_handler_145: LAPIC_INTR_HANDLER(145)
lapic_intr_dummy_handler_146: LAPIC_INTR_HANDLER(146)
lapic_intr_dummy_handler_147: LAPIC_INTR_HANDLER(147)
lapic_intr_dummy_handler_148: LAPIC_INTR_HANDLER(148)
lapic_intr_dummy_handler_149: LAPIC_INTR_HANDLER(149)
lapic_intr_dummy_handler_150: LAPIC_INTR_HANDLER(150)
lapic_intr_dummy_handler_151: LAPIC_INTR_HANDLER(151)
lapic_intr_dummy_handler_152: LAPIC_INTR_HANDLER(152)
lapic_intr_dummy_handler_153: LAPIC_INTR_HANDLER(153)
lapic_intr_dummy_handler_154: LAPIC_INTR_HANDLER(154)
lapic_intr_dummy_handler_155: LAPIC_INTR_HANDLER(155)
lapic_intr_dummy_handler_156: LAPIC_INTR_HANDLER(156)
lapic_intr_dummy_handler_157: LAPIC_INTR_HANDLER(157)
lapic_intr_dummy_handler_158: LAPIC_INTR_HANDLER(158)
lapic_intr_dummy_handler_159: LAPIC_INTR_HANDLER(159)
lapic_intr_dummy_handler_160: LAPIC_INTR_HANDLER(160)
lapic_intr_dummy_handler_161: LAPIC_INTR_HANDLER(161)
lapic_intr_dummy_handler_162: LAPIC_INTR_HANDLER(162)
lapic_intr_dummy_handler_163: LAPIC_INTR_HANDLER(163)
lapic_intr_dummy_handler_164: LAPIC_INTR_HANDLER(164)
lapic_intr_dummy_handler_165: LAPIC_INTR_HANDLER(165)
lapic_intr_dummy_handler_166: LAPIC_INTR_HANDLER(166)
lapic_intr_dummy_handler_167: LAPIC_INTR_HANDLER(167)
lapic_intr_dummy_handler_168: LAPIC_INTR_HANDLER(168)
lapic_intr_dummy_handler_169: LAPIC_INTR_HANDLER(169)
lapic_intr_dummy_handler_170: LAPIC_INTR_HANDLER(170)
lapic_intr_dummy_handler_171: LAPIC_INTR_HANDLER(171)
lapic_intr_dummy_handler_172: LAPIC_INTR_HANDLER(172)
lapic_intr_dummy_handler_173: LAPIC_INTR_HANDLER(173)
lapic_intr_dummy_handler_174: LAPIC_INTR_HANDLER(174)
lapic_intr_dummy_handler_175: LAPIC_INTR_HANDLER(175)
lapic_intr_dummy_handler_176: LAPIC_INTR_HANDLER(176)
lapic_intr_dummy_handler_177: LAPIC_INTR_HANDLER(177)
lapic_intr_dummy_handler_178: LAPIC_INTR_HANDLER(178)
lapic_intr_dummy_handler_179: LAPIC_INTR_HANDLER(179)
lapic_intr_dummy_handler_180: LAPIC_INTR_HANDLER(180)
lapic_intr_dummy_handler_181: LAPIC_INTR_HANDLER(181)
lapic_intr_dummy_handler_182: LAPIC_INTR_HANDLER(182)
lapic_intr_dummy_handler_183: LAPIC_INTR_HANDLER(183)
lapic_intr_dummy_handler_184: LAPIC_INTR_HANDLER(184)
lapic_intr_dummy_handler_185: LAPIC_INTR_HANDLER(185)
lapic_intr_dummy_handler_186: LAPIC_INTR_HANDLER(186)
lapic_intr_dummy_handler_187: LAPIC_INTR_HANDLER(187)
lapic_intr_dummy_handler_188: LAPIC_INTR_HANDLER(188)
lapic_intr_dummy_handler_189: LAPIC_INTR_HANDLER(189)
lapic_intr_dummy_handler_190: LAPIC_INTR_HANDLER(190)
lapic_intr_dummy_handler_191: LAPIC_INTR_HANDLER(191)
lapic_intr_dummy_handler_192: LAPIC_INTR_HANDLER(192)
lapic_intr_dummy_handler_193: LAPIC_INTR_HANDLER(193)
lapic_intr_dummy_handler_194: LAPIC_INTR_HANDLER(194)
lapic_intr_dummy_handler_195: LAPIC_INTR_HANDLER(195)
lapic_intr_dummy_handler_196: LAPIC_INTR_HANDLER(196)
lapic_intr_dummy_handler_197: LAPIC_INTR_HANDLER(197)
lapic_intr_dummy_handler_198: LAPIC_INTR_HANDLER(198)
lapic_intr_dummy_handler_199: LAPIC_INTR_HANDLER(199)
lapic_intr_dummy_handler_200: LAPIC_INTR_HANDLER(200)
lapic_intr_dummy_handler_201: LAPIC_INTR_HANDLER(201)
lapic_intr_dummy_handler_202: LAPIC_INTR_HANDLER(202)
lapic_intr_dummy_handler_203: LAPIC_INTR_HANDLER(203)
lapic_intr_dummy_handler_204: LAPIC_INTR_HANDLER(204)
lapic_intr_dummy_handler_205: LAPIC_INTR_HANDLER(205)
lapic_intr_dummy_handler_206: LAPIC_INTR_HANDLER(206)
lapic_intr_dummy_handler_207: LAPIC_INTR_HANDLER(207)
lapic_intr_dummy_handler_208: LAPIC_INTR_HANDLER(208)
lapic_intr_dummy_handler_209: LAPIC_INTR_HANDLER(209)
lapic_intr_dummy_handler_210: LAPIC_INTR_HANDLER(210)
lapic_intr_dummy_handler_211: LAPIC_INTR_HANDLER(211)
lapic_intr_dummy_handler_212: LAPIC_INTR_HANDLER(212)
lapic_intr_dummy_handler_213: LAPIC_INTR_HANDLER(213)
lapic_intr_dummy_handler_214: LAPIC_INTR_HANDLER(214)
lapic_intr_dummy_handler_215: LAPIC_INTR_HANDLER(215)
lapic_intr_dummy_handler_216: LAPIC_INTR_HANDLER(216)
lapic_intr_dummy_handler_217: LAPIC_INTR_HANDLER(217)
lapic_intr_dummy_handler_218: LAPIC_INTR_HANDLER(218)
lapic_intr_dummy_handler_219: LAPIC_INTR_HANDLER(219)
lapic_intr_dummy_handler_220: LAPIC_INTR_HANDLER(220)
lapic_intr_dummy_handler_221: LAPIC_INTR_HANDLER(221)
lapic_intr_dummy_handler_222: LAPIC_INTR_HANDLER(222)
lapic_intr_dummy_handler_223: LAPIC_INTR_HANDLER(223)
lapic_intr_dummy_handler_224: LAPIC_INTR_HANDLER(224)
lapic_intr_dummy_handler_225: LAPIC_INTR_HANDLER(225)
lapic_intr_dummy_handler_226: LAPIC_INTR_HANDLER(226)
lapic_intr_dummy_handler_227: LAPIC_INTR_HANDLER(227)
lapic_intr_dummy_handler_228: LAPIC_INTR_HANDLER(228)
lapic_intr_dummy_handler_229: LAPIC_INTR_HANDLER(229)
lapic_intr_dummy_handler_230: LAPIC_INTR_HANDLER(230)
lapic_intr_dummy_handler_231: LAPIC_INTR_HANDLER(231)
lapic_intr_dummy_handler_232: LAPIC_INTR_HANDLER(232)
lapic_intr_dummy_handler_233: LAPIC_INTR_HANDLER(233)
lapic_intr_dummy_handler_234: LAPIC_INTR_HANDLER(234)
lapic_intr_dummy_handler_235: LAPIC_INTR_HANDLER(235)
lapic_intr_dummy_handler_236: LAPIC_INTR_HANDLER(236)
lapic_intr_dummy_handler_237: LAPIC_INTR_HANDLER(237)
lapic_intr_dummy_handler_238: LAPIC_INTR_HANDLER(238)
lapic_intr_dummy_handler_239: LAPIC_INTR_HANDLER(239)
lapic_intr_dummy_handler_240: LAPIC_INTR_HANDLER(240)
lapic_intr_dummy_handler_241: LAPIC_INTR_HANDLER(241)
lapic_intr_dummy_handler_242: LAPIC_INTR_HANDLER(242)
lapic_intr_dummy_handler_243: LAPIC_INTR_HANDLER(243)
lapic_intr_dummy_handler_244: LAPIC_INTR_HANDLER(244)
lapic_intr_dummy_handler_245: LAPIC_INTR_HANDLER(245)
lapic_intr_dummy_handler_246: LAPIC_INTR_HANDLER(246)
lapic_intr_dummy_handler_247: LAPIC_INTR_HANDLER(247)
lapic_intr_dummy_handler_248: LAPIC_INTR_HANDLER(248)
lapic_intr_dummy_handler_249: LAPIC_INTR_HANDLER(249)
lapic_intr_dummy_handler_250: LAPIC_INTR_HANDLER(250)
lapic_intr_dummy_handler_251: LAPIC_INTR_HANDLER(251)
lapic_intr_dummy_handler_252: LAPIC_INTR_HANDLER(252)
lapic_intr_dummy_handler_253: LAPIC_INTR_HANDLER(253)
lapic_intr_dummy_handler_254: LAPIC_INTR_HANDLER(254)
lapic_intr_dummy_handler_255: LAPIC_INTR_HANDLER(255)

PUBLIC	_lapic_intr_dummy_handles_end
_lapic_intr_dummy_handles_end:

END
