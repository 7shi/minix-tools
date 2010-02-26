extern _pipe();

void __declspec(naked) pipe()
{
	__asm jmp _pipe
}
