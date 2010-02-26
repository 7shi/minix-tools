extern _truncate();

void __declspec(naked) truncate()
{
	__asm jmp _truncate
}

extern _ftruncate();

void __declspec(naked) ftruncate()
{
	__asm jmp _ftruncate
}
