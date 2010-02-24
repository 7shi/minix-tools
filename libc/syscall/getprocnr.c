extern _getprocnr();

void __declspec(naked) getprocnr()
{
	__asm jmp _getprocnr
}
