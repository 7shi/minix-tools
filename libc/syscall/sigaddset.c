extern _sigaddset();

void __declspec(naked) sigaddset()
{
	__asm jmp _sigaddset
}
