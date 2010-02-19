/*
 * (c) copyright 1987 by the Vrije Universiteit, Amsterdam, The Netherlands.
 * See the copyright notice in the ACK home directory, in the file "Copyright".
 */
/* $Header$ */

#include	<stdlib.h>

#ifdef _MSC_VER
#define labs _labs
#endif

long
labs(register long l)
{
	return l >= 0 ? l : -l;
}
