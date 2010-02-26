extern _getnprocnr();

void __declspec(naked) getnprocnr()
{
	__asm jmp _getnprocnr
}
