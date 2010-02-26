extern _open();

void __declspec(naked) open()
{
	__asm jmp _open
}
