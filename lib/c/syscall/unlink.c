extern _unlink();

void __declspec(naked) unlink()
{
	__asm jmp _unlink
}
