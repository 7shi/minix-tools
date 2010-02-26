extern _fchmod();

void __declspec(naked) fchmod()
{
	__asm jmp _fchmod
}
