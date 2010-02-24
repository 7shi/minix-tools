extern _vm_set_priv();

void __declspec(naked) vm_set_priv()
{
	__asm jmp _vm_set_priv
}
