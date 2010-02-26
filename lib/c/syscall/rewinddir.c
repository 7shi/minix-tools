extern _rewinddir();

void __declspec(naked) rewinddir()
{
	__asm jmp _rewinddir
}
