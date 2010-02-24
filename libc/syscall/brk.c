extern _brk();

void __declspec(naked) brk()
{
	__asm jmp _brk
}
