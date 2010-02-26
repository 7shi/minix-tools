extern _readdir();

void __declspec(naked) readdir()
{
	__asm jmp _readdir
}
