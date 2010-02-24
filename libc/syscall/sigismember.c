extern _sigismember();

void __declspec(naked) sigismember()
{
	__asm jmp _sigismember
}
