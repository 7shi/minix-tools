extern _select();

void __declspec(naked) select()
{
	__asm jmp _select
}
