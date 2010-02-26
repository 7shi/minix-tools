extern _sigreturn();

void __declspec(naked) sigreturn()
{
	__asm jmp _sigreturn
}
