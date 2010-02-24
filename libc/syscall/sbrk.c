extern _sbrk();

void __declspec(naked) sbrk()
{
	__asm jmp _sbrk
}
