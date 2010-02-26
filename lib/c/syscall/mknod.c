extern _mknod();

void __declspec(naked) mknod()
{
	__asm jmp _mknod
}
