extern _close();

void __declspec(naked) close()
{
	__asm jmp _close
}
