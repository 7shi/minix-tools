extern _getsysinfo();

void __declspec(naked) getsysinfo()
{
	__asm jmp _getsysinfo
}

extern _getsysinfo_up();

void __declspec(naked) getsysinfo_up()
{
	__asm jmp _getsysinfo_up
}
