extern _killpg();

void __declspec(naked) killpg()
{
	__asm jmp _killpg
}
