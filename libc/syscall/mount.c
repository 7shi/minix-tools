extern _mount();

void __declspec(naked) mount()
{
	__asm jmp _mount
}
