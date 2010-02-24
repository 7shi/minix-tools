extern _mkdir();

void __declspec(naked) mkdir()
{
	__asm jmp _mkdir
}
