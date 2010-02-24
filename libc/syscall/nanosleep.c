extern _nanosleep();

void __declspec(naked) nanosleep()
{
	__asm jmp _nanosleep
}
