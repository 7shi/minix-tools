extern _mkfifo();

void __declspec(naked) mkfifo()
{
	__asm jmp _mkfifo
}
