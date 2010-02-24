extern _setitimer();

void __declspec(naked) setitimer()
{
	__asm jmp _setitimer
}
