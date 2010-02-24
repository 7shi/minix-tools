extern _opendir();

void __declspec(naked) opendir()
{
	__asm jmp _opendir
}
