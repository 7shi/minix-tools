extern _getnpid();

void __declspec(naked) getnpid()
{
	__asm jmp _getnpid
}
