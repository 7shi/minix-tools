extern _sigdelset();

void __declspec(naked) sigdelset()
{
	__asm jmp _sigdelset
}
