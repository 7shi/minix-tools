extern _isatty();

void __declspec(naked) isatty()
{
	__asm jmp _isatty
}
