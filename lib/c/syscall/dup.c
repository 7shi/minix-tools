extern _dup();

void __declspec(naked) dup()
{
	__asm jmp _dup
}
