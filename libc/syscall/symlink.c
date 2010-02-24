extern _symlink();

void __declspec(naked) symlink()
{
	__asm jmp _symlink
}
