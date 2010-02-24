extern _fork();

void __declspec(naked) fork()
{
	__asm jmp _fork
}
