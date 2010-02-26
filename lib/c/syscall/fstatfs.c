extern _fstatfs();

void __declspec(naked) fstatfs()
{
	__asm jmp _fstatfs
}
