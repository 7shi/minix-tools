extern _getpgrp();

void __declspec(naked) getpgrp()
{
	__asm jmp _getpgrp
}
