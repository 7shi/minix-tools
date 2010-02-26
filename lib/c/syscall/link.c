extern _link();

void __declspec(naked) link()
{
	__asm jmp _link
}
