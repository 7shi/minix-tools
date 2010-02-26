extern _vm_query_exit();

void __declspec(naked) vm_query_exit()
{
	__asm jmp _vm_query_exit
}
