extern _fcntl();

void __declspec(naked) fcntl()
{
	__asm jmp _fcntl
}
