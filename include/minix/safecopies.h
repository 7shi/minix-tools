
#ifndef _MINIX_SAFECOPIES_H
#define _MINIX_SAFECOPIES_H 1

#include <minix/sys_config.h>
#include <minix/types.h>
#include <stdint.h>

typedef int32_t cp_grant_id_t;

typedef struct {
	int cp_flags;	/* CPF_* below */
	union {
		struct {
			/* CPF_DIRECT */
			endpoint_t	cp_who_to;	/* grantee */
			vir_bytes	cp_start;	/* memory */
			size_t		cp_len;		/* size in bytes */
			char		cp_reserved[8]; /* future use */
		} cp_direct;
		struct {
			/* CPF_INDIRECT */
			endpoint_t	cp_who_to;	/* grantee */
			endpoint_t	cp_who_from;	/* previous granter */
			cp_grant_id_t	cp_grant;	/* previous grant */
			char		cp_reserved[8];/* future use */
		} cp_indirect;
		struct {
			/* CPF_MAGIC */
			endpoint_t	cp_who_from;	/* granter */
			endpoint_t	cp_who_to;	/* grantee */
			vir_bytes	cp_start;	/* memory */
			size_t		cp_len;		/* size in bytes */
			char		cp_reserved[8]; /* future use */
		} cp_magic;
	} cp_u;
	char cp_reserved[8];				/* future use */
} cp_grant_t;

/* Vectored safecopy. */
struct vscp_vec {
        /* Exactly one of the following must be SELF. */
        endpoint_t      v_from;         /* source */
        endpoint_t      v_to;           /* destination */
  
        cp_grant_id_t   v_gid;          /* grant id of other process */
        size_t          v_offset;       /* offset in other grant */
        vir_bytes       v_addr;         /* address in copier's space */
        size_t          v_bytes;        /* no. of bytes */
};

/* Types on VM invocation. */
#define VMPTYPE_NONE		0
#define VMPTYPE_CHECK		1
#define VMPTYPE_COWMAP		2
#define VMPTYPE_SMAP		3
#define VMPTYPE_SUNMAP		4

/* Invalid grant number. */
#define GRANT_INVALID	-1
#define GRANT_VALID(g)	((g) > GRANT_INVALID)

/* Operations: any combination is ok. */
#define CPF_READ	0x000001 /* Granted process may read. */
#define CPF_WRITE	0x000002 /* Granted process may write. */
#define CPF_MAP		0x000004 /* Granted process may map. */

/* Internal flags. */
#define CPF_USED	0x000100 /* Grant slot in use. */
#define CPF_DIRECT	0x000200 /* Grant from this process to another. */
#define CPF_INDIRECT	0x000400 /* Grant from grant to another. */
#define CPF_MAGIC	0x000800 /* Grant from any to any. */
#define CPF_VALID	0x001000 /* Grant slot contains valid grant. */

/* Prototypes for functions in libsys. */
_PROTOTYPE( cp_grant_id_t cpf_grant_direct, (endpoint_t, vir_bytes, size_t, int));
_PROTOTYPE( cp_grant_id_t cpf_grant_indirect, (endpoint_t, endpoint_t, cp_grant_id_t));
_PROTOTYPE( cp_grant_id_t cpf_grant_magic, (endpoint_t, endpoint_t, vir_bytes, size_t, int));
_PROTOTYPE( int cpf_revoke, (cp_grant_id_t grant_id));
_PROTOTYPE( int cpf_lookup, (cp_grant_id_t g, endpoint_t *ep, endpoint_t *ep2));

_PROTOTYPE( int cpf_getgrants, (cp_grant_id_t *grant_ids, int n));
_PROTOTYPE( int cpf_setgrant_direct, (cp_grant_id_t g, endpoint_t who,
	vir_bytes addr, size_t size, int access));
_PROTOTYPE( int cpf_setgrant_indirect, (cp_grant_id_t g, endpoint_t who_to,
	endpoint_t who_from, cp_grant_id_t his_g));
_PROTOTYPE( int cpf_setgrant_magic, (cp_grant_id_t g, endpoint_t who_to,
	endpoint_t who_from, vir_bytes addr, size_t bytes, int access));
_PROTOTYPE( int cpf_setgrant_disable, (cp_grant_id_t grant_id));
_PROTOTYPE( void cpf_reload, (void));

/* Set a process' grant table location and size (in-kernel only). */
#define _K_SET_GRANT_TABLE(rp, ptr, entries)	\
	priv(rp)->s_grant_table= (ptr);		\
	priv(rp)->s_grant_entries= (entries);

#endif	/* _MINIX_SAFECOPIES_H */

