extern _read();

void __declspec(naked) read()
{
	__asm jmp _read
}
