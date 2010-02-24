extern _dup2();

void __declspec(naked) dup2()
{
	__asm jmp _dup2
}
