extern _getnuid();

void __declspec(naked) getnuid()
{
	__asm jmp _getnuid
}
