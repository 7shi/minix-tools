extern _deldma();

void __declspec(naked) deldma()
{
	__asm jmp _deldma
}
