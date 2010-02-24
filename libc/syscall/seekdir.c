extern _seekdir();

void __declspec(naked) seekdir()
{
	__asm jmp _seekdir
}
