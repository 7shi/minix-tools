extern _creat();

void __declspec(naked) creat()
{
	__asm jmp _creat
}
