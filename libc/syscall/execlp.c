extern _execlp();

void __declspec(naked) execlp()
{
	__asm jmp _execlp
}
