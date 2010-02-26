extern _fchown();

void __declspec(naked) fchown()
{
	__asm jmp _fchown
}
