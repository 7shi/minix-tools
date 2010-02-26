extern _vm_unmap();

void __declspec(naked) vm_unmap()
{
	__asm jmp _vm_unmap
}
