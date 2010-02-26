extern _mapdriver();

void __declspec(naked) mapdriver()
{
	__asm jmp _mapdriver
}
