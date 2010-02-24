extern _getppid();

void __declspec(naked) getppid()
{
	__asm jmp _getppid
}
