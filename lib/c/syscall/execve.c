extern _execve();

void __declspec(naked) execve()
{
	__asm jmp _execve
}
