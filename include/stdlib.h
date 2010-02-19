/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"/usr/include/stdlib.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */

/* The <stdlib.h> header defines certain common macros, types, and functions.*/

#ifndef _STDLIB_H
#ifndef _PARAMS
#if defined(__STDC__) || defined(__cplusplus)
#define _PARAMS(ARGS) ARGS
#else
#define _PARAMS(ARGS) ()
#endif
#endif /* _PARAMS */
#define _STDLIB_H

#ifndef _ANSI_H
#include <ansi.h>
#endif

/* The macros are NULL, EXIT_FAILURE, EXIT_SUCCESS, RAND_MAX, and MB_CUR_MAX.*/
#ifndef NULL
#define NULL 0
#endif

#define EXIT_FAILURE       1	/* standard error return using exit() */
#define EXIT_SUCCESS       0	/* successful return using exit() */
#define RAND_MAX       32767	/* largest value generated by rand() */
#define MB_CUR_MAX         1	/* max value of multibyte character in MINIX */

typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;

/* The types are size_t, wchar_t, div_t, and ldiv_t. */
#ifndef _SIZE_T
#define _SIZE_T
#if !defined(_GCC_SIZE_T)
#define _GCC_SIZE_T
#ifndef __SIZE_TYPE__
#define __SIZE_TYPE__ long unsigned int
#endif
typedef __SIZE_TYPE__ size_t;
#endif
	/* type returned by sizeof */
#endif

#ifndef _WCHAR_T
#define _WCHAR_T
#ifndef __cplusplus
#if !defined(_GCC_WCHAR_T) && ! defined(__cplusplus)
#define _GCC_WCHAR_T
#ifndef __WCHAR_TYPE__
#define __WCHAR_TYPE__ char
#endif
typedef __WCHAR_TYPE__ wchar_t;
#endif

#endif		/* type expanded character set */
#endif

/* Function Prototypes. */
_PROTOTYPE( void abort, (void)						);
_PROTOTYPE( int abs, (int _j)						);
_PROTOTYPE( int atexit, (void (*_func)(void))				);
_PROTOTYPE( double atof, (const char *_nptr)				);
_PROTOTYPE( int atoi, (const char *_nptr)				);
_PROTOTYPE( long atol , (const char *_nptr)				);
_PROTOTYPE( void *calloc, (size_t _nmemb, size_t _size)			);
_PROTOTYPE( div_t div, (int _numer, int _denom)				);
_PROTOTYPE( void exit, (int _status)					);
_PROTOTYPE( void free, (void *_ptr)					);
_PROTOTYPE( char *getenv, (const char *_name)				);
_PROTOTYPE( long labs, (long _j)					);
_PROTOTYPE( ldiv_t ldiv, (long _numer, long _denom)			);
_PROTOTYPE( void *malloc, (size_t _size)				);
_PROTOTYPE( int mblen, (const char *_s, size_t _n)			);
_PROTOTYPE( size_t mbstowcs, (wchar_t *_pwcs, const char *_s, size_t _n));
_PROTOTYPE( int mbtowc, (wchar_t *_pwc, const char *_s, size_t _n)	);
_PROTOTYPE( int rand, (void)						);
_PROTOTYPE( void *realloc, (void *_ptr, size_t _size)			);
_PROTOTYPE( void srand, (unsigned int _seed)				);
_PROTOTYPE( double strtod, (const char *_nptr, char **_endptr)		);
_PROTOTYPE( long strtol, (const char *_nptr, char **_endptr, int _base)	);
_PROTOTYPE( int system, (const char *_string)				);
_PROTOTYPE( size_t wcstombs, (char *_s, const wchar_t *_pwcs, size_t _n));
_PROTOTYPE( int wctomb, (char *_s, wchar_t _wchar)			);
_PROTOTYPE( void *bsearch, (const void *_key, const void *_base, 
	size_t _nmemb, size_t _size, 
	int (*compar) (const void *, const void *))			);
_PROTOTYPE( void qsort, (void *_base, size_t _nmemb, size_t _size,
	int (*compar) (const void *, const void *))			);
_PROTOTYPE( unsigned long int strtoul,
			(const char *_nptr, char **_endptr, int _base)	);

#ifdef _POSIX_SOURCE
/* Open Group Base Specifications Issue 6 */
_PROTOTYPE( int mkstemp, (char *_fmt)					);
_PROTOTYPE( char *initstate, (unsigned _seed, char *_state,
							size_t _size)	);
_PROTOTYPE( long random, (void)						);
_PROTOTYPE( char *realpath, (const char *file_name, 
                                                 char *resolved_name)   );
_PROTOTYPE( char *setstate, (const char *state)				);
_PROTOTYPE( void srandom, (unsigned seed)				);
_PROTOTYPE( int putenv, (char *string)					);
_PROTOTYPE( int setenv, (const char *envname, const char *envval,
							int overwrite)	);
_PROTOTYPE( int unsetenv, (const char *name)				);

#ifdef __LONG_LONG_SUPPORTED
_PROTOTYPE( long long strtoll, (const char *_nptr, char **_endptr,
                                                            int _base)	);
_PROTOTYPE( unsigned long long strtoull, (const char *_nptr, 
                                            char **_endptr, int _base)	);
#endif

#endif

#ifdef _MINIX
_PROTOTYPE( int getloadavg, (double *, int)				);

/* According to POSIX, getopt should be in unistd.h. What do we do with
 * this?
 */
_PROTOTYPE(int getopt, (int _argc, char * const _argv[], const char *_opts));
extern char *optarg;
extern int optind, opterr, optopt;
#endif /* _MINIX */

#endif /* STDLIB_H */
