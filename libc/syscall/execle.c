extern _execle();

void __declspec(naked) execle()
{
	__asm jmp _execle
}
