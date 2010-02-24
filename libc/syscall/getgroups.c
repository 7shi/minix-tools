extern _getgroups();

void __declspec(naked) getgroups()
{
	__asm jmp _getgroups
}
