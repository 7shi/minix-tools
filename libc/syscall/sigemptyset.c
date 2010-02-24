extern _sigemptyset();

void __declspec(naked) sigemptyset()
{
	__asm jmp _sigemptyset
}
