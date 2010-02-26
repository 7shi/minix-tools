extern _getdma();

void __declspec(naked) getdma()
{
	__asm jmp _getdma
}
