extern _setsid();

void __declspec(naked) setsid()
{
	__asm jmp _setsid
}
