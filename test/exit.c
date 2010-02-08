int m[] = { 0, 1/*EXIT*/, 42, 0, 0, 0, 0, 0, 0 };

void start()
{
#if defined(__GNUC__)
	asm("mov eax, 0; mov ecx, 3; int 0x21" :: "b"(m));
#elif defined(_MSC_VER)
	__asm
	{
		mov eax, 0
		lea ebx, m
		mov ecx, 3
		int 0x21
	}
#else
#	error "unknown compiler"
#endif
}
