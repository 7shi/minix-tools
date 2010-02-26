extern _stime();

void __declspec(naked) stime()
{
	__asm jmp _stime
}
