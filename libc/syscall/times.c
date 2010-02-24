extern _times();

void __declspec(naked) times()
{
	__asm jmp _times
}
