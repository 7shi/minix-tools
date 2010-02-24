extern _waitpid();

void __declspec(naked) waitpid()
{
	__asm jmp _waitpid
}
