extern _chdir();

void __declspec(naked) chdir()
{
	__asm jmp _chdir
}

extern _fchdir();

void __declspec(naked) fchdir()
{
	__asm jmp _fchdir
}
