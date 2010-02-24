extern _cfgetospeed();

void __declspec(naked) cfgetospeed()
{
	__asm jmp _cfgetospeed
}
