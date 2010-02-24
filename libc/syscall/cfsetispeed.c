extern _cfsetispeed();

void __declspec(naked) cfsetispeed()
{
	__asm jmp _cfsetispeed
}
