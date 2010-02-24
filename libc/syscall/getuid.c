extern _getuid();

void __declspec(naked) getuid()
{
	__asm jmp _getuid
}
