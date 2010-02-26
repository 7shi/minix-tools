extern _sigprocmask();

void __declspec(naked) sigprocmask()
{
	__asm jmp _sigprocmask
}
