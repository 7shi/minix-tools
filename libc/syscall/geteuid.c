extern _geteuid();

void __declspec(naked) geteuid()
{
	__asm jmp _geteuid
}
