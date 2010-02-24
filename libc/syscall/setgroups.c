extern _setgroups();

void __declspec(naked) setgroups()
{
	__asm jmp _setgroups
}
