extern _rmdir();

void __declspec(naked) rmdir()
{
	__asm jmp _rmdir
}
