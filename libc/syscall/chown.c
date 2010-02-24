extern _chown();

void __declspec(naked) chown()
{
	__asm jmp _chown
}
