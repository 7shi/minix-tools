extern _sync();

void __declspec(naked) sync()
{
	__asm jmp _sync
}
