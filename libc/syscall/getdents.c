extern _getdents();

void __declspec(naked) getdents()
{
	__asm jmp _getdents
}
