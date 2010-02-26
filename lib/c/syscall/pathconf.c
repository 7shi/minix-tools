extern _pathconf();

void __declspec(naked) pathconf()
{
	__asm jmp _pathconf
}
