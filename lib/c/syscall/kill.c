extern _kill();

void __declspec(naked) kill()
{
	__asm jmp _kill
}
