extern _getitimer();

void __declspec(naked) getitimer()
{
	__asm jmp _getitimer
}
