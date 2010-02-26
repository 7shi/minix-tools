extern _svrctl();

void __declspec(naked) svrctl()
{
	__asm jmp _svrctl
}
