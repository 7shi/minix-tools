extern _fstat();

void __declspec(naked) fstat()
{
	__asm jmp _fstat
}
