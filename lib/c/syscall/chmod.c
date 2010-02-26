extern _chmod();

void __declspec(naked) chmod()
{
	__asm jmp _chmod
}
