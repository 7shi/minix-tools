extern _tcdrain();

void __declspec(naked) tcdrain()
{
	__asm jmp _tcdrain
}
