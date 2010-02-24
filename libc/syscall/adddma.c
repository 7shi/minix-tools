extern _adddma();

void __declspec(naked) adddma()
{
	__asm jmp _adddma
}
