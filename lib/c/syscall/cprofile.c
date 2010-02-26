extern _cprofile();

void __declspec(naked) cprofile()
{
	__asm jmp _cprofile
}
