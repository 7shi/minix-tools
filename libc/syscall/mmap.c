extern _mmap();

void __declspec(naked) mmap()
{
	__asm jmp _mmap
}

extern _munmap();

void __declspec(naked) munmap()
{
	__asm jmp _munmap
}

extern _munmap_text();

void __declspec(naked) munmap_text()
{
	__asm jmp _munmap_text
}
