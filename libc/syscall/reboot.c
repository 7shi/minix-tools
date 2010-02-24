extern _reboot();

void __declspec(naked) reboot()
{
	__asm jmp _reboot
}
