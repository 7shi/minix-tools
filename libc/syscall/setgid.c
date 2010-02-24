extern _setgid();

void __declspec(naked) setgid()
{
	__asm jmp _setgid
}

extern _setegid();

void __declspec(naked) setegid()
{
	__asm jmp _setegid
}
