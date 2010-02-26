extern _vm_remap();

void __declspec(naked) vm_remap()
{
	__asm jmp _vm_remap
}
