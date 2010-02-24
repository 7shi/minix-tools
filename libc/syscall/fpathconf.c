extern _fpathconf();

void __declspec(naked) fpathconf()
{
	__asm jmp _fpathconf
}
