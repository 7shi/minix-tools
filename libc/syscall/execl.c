extern _execl();

void __declspec(naked) execl()
{
	__asm jmp _execl
}
