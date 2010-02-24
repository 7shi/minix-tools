extern _chroot();

void __declspec(naked) chroot()
{
	__asm jmp _chroot
}
