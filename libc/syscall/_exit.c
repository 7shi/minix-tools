extern __exit();

void __declspec(naked) _exit()
{
	__asm jmp __exit
}
