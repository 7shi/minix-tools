extern _write();

void __declspec(naked) write()
{
	__asm jmp _write
}
