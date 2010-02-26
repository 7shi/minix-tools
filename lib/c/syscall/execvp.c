extern _execvp();

void __declspec(naked) execvp()
{
	__asm jmp _execvp
}
