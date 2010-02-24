extern _getngid();

void __declspec(naked) getngid()
{
	__asm jmp _getngid
}
