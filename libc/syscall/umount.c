extern _umount();

void __declspec(naked) umount()
{
	__asm jmp _umount
}
