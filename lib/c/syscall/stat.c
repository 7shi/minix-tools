extern _stat();

void __declspec(naked) stat()
{
	__asm jmp _stat
}
