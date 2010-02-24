extern _vm_getrefcount();

void __declspec(naked) vm_getrefcount()
{
	__asm jmp _vm_getrefcount
}
