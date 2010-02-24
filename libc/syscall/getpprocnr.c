extern _getpprocnr();

void __declspec(naked) getpprocnr()
{
	__asm jmp _getpprocnr
}
