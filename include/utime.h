/* The <utime.h> header is used for the utime() system call. */

#ifndef _UTIME_H
#ifndef _PARAMS
#if defined(__STDC__) || defined(__cplusplus)
#define _PARAMS(ARGS) ARGS
#else
#define _PARAMS(ARGS) ()
#endif
#endif /* _PARAMS */
#define _UTIME_H

#ifndef _TYPES_H
#include <minix/types.h>
#endif

struct utimbuf {
  time_t actime;		/* access time */
  time_t modtime;		/* modification time */
};

/* Function Prototypes. */
_PROTOTYPE( int utime, (const char *_path, const struct utimbuf *_times)     );

#endif /* _UTIME_H */
