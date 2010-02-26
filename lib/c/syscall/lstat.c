extern _lstat();

void __declspec(naked) lstat()
{
	__asm jmp _lstat
}
