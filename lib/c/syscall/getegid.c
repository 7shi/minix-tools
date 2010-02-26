extern _getegid();

void __declspec(naked) getegid()
{
	__asm jmp _getegid
}
