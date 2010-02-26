extern _cfgetispeed();

void __declspec(naked) cfgetispeed()
{
	__asm jmp _cfgetispeed
}
