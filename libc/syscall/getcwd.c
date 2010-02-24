extern _getcwd();

void __declspec(naked) getcwd()
{
	__asm jmp _getcwd
}
