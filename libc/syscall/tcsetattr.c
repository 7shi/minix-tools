extern _tcsetattr();

void __declspec(naked) tcsetattr()
{
	__asm jmp _tcsetattr
}
