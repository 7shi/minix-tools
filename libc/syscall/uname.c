extern _uname();

void __declspec(naked) uname()
{
	__asm jmp _uname
}
