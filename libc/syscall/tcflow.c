extern _tcflow();

void __declspec(naked) tcflow()
{
	__asm jmp _tcflow
}
