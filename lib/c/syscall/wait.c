extern _wait();

void __declspec(naked) wait()
{
	__asm jmp _wait
}
