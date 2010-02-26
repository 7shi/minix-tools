extern _ptrace();

void __declspec(naked) ptrace()
{
	__asm jmp _ptrace
}
