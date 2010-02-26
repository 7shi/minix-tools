extern _tcsendbreak();

void __declspec(naked) tcsendbreak()
{
	__asm jmp _tcsendbreak
}
