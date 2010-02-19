#include <stdio.h>
#include <stdlib.h>

int _penviron, _brksize;

void _f_print() {}
double strtod(const char *_nptr, char **_endptr) { return 0; }
void __sigreturn() {}
void __pm_findproc() {}

void start()
{
	printf("Hello, World!\n");
	exit(0);
}
