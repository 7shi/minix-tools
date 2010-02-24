extern _time();

void __declspec(naked) time()
{
	__asm jmp _time
}
