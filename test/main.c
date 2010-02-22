#include <stdio.h>
#include <stdlib.h>

int _penviron, _brksize;
void __sigreturn() {}

void start()
{
	printf("Hello, World!\n");
	exit(0);
}
