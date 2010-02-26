extern _getgid();

void __declspec(naked) getgid()
{
	__asm jmp _getgid
}
