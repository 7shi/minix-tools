extern _getpid();

void __declspec(naked) getpid()
{
	__asm jmp _getpid
}
