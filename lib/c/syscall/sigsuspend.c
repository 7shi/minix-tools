extern _sigsuspend();

void __declspec(naked) sigsuspend()
{
	__asm jmp _sigsuspend
}
