extern _readlink();

void __declspec(naked) readlink()
{
	__asm jmp _readlink
}
