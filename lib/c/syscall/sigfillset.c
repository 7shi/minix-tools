extern _sigfillset();

void __declspec(naked) sigfillset()
{
	__asm jmp _sigfillset
}
