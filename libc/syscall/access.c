extern _access();

void __declspec(naked) access()
{
	__asm jmp _access
}
