extern _umask();

void __declspec(naked) umask()
{
	__asm jmp _umask
}
