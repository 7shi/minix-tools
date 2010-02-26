extern _utime();

void __declspec(naked) utime()
{
	__asm jmp _utime
}
