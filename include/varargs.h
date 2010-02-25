#ifndef _VARARGS_H
#define _VARARGS_H

#ifdef __GNUC__
#error "GCC no longer implements <varargs.h>."
#error "Revise your code to use <stdarg.h>."
#else
#include <stdarg.h>
#endif

#endif
