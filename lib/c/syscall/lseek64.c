extern _lseek64();

void __declspec(naked) lseek64()
{
	__asm jmp _lseek64
}
