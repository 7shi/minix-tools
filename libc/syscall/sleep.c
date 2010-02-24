extern _sleep();

void __declspec(naked) sleep()
{
	__asm jmp _sleep
}
