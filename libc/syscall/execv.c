extern _execv();

void __declspec(naked) execv()
{
	__asm jmp _execv
}
