extern _pause();

void __declspec(naked) pause()
{
	__asm jmp _pause
}
