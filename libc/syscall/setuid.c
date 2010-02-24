extern _setuid();

void __declspec(naked) setuid()
{
	__asm jmp _setuid
}

extern _seteuid();

void __declspec(naked) seteuid()
{
	__asm jmp _seteuid
}
