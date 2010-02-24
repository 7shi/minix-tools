extern _alarm();

void __declspec(naked) alarm()
{
	__asm jmp _alarm
}
