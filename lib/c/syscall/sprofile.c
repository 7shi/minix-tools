extern _sprofile();

void __declspec(naked) sprofile()
{
	__asm jmp _sprofile
}
