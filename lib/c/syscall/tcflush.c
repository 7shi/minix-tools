extern _tcflush();

void __declspec(naked) tcflush()
{
	__asm jmp _tcflush
}
