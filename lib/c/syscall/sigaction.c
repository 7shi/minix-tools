extern _sigaction();

void __declspec(naked) sigaction()
{
	__asm jmp _sigaction
}
