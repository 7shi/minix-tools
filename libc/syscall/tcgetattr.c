extern _tcgetattr();

void __declspec(naked) tcgetattr()
{
	__asm jmp _tcgetattr
}
