extern _vm_adddma();

void __declspec(naked) vm_adddma()
{
	__asm jmp _vm_adddma
}

extern _vm_deldma();

void __declspec(naked) vm_deldma()
{
	__asm jmp _vm_deldma
}

extern _vm_getdma();

void __declspec(naked) vm_getdma()
{
	__asm jmp _vm_getdma
}
