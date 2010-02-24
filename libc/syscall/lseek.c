extern _lseek();

void __declspec(naked) lseek()
{
	__asm jmp _lseek
}
