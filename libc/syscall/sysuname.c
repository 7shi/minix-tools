extern _sysuname();

void __declspec(naked) sysuname()
{
	__asm jmp _sysuname
}
