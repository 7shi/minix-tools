extern _getsigset();

void __declspec(naked) getsigset()
{
	__asm jmp _getsigset
}
