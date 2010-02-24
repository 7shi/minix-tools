extern _closedir();

void __declspec(naked) closedir()
{
	__asm jmp _closedir
}
