extern __pm_findproc();

void __declspec(naked) _pm_findproc()
{
	__asm jmp __pm_findproc
}
