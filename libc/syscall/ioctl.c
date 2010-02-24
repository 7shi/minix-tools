extern _ioctl();

void __declspec(naked) ioctl()
{
	__asm jmp _ioctl
}
