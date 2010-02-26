;	intr_disable(), intr_enable - Disable/Enable hardware interrupts.
;							Author: Kees J. Bot
;								18 Mar 1996
;	void intr_disable(void);
;	void intr_enable(void);

.386
.MODEL FLAT
.CODE
PUBLIC _intr_disable
_intr_disable:
	cli
	ret

PUBLIC _intr_enable
_intr_enable:
	sti
	ret

END
