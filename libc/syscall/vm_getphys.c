extern _vm_getphys();

void __declspec(naked) vm_getphys()
{
	__asm jmp _vm_getphys
}
