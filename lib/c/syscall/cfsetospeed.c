extern _cfsetospeed();

void __declspec(naked) cfsetospeed()
{
	__asm jmp _cfsetospeed
}
