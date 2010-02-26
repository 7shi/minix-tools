extern _sigpending();

void __declspec(naked) sigpending()
{
	__asm jmp _sigpending
}
