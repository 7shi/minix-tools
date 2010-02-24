extern _rename();

void __declspec(naked) rename()
{
	__asm jmp _rename
}
