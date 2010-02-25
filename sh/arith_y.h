#define ARITH_NUM 257
#define ARITH_LPAREN 258
#define ARITH_RPAREN 259
#define ARITH_VAR 260
#define ARITH_ASSIGN 261
#define ARITH_ADDASSIGN 262
#define ARITH_SUBASSIGN 263
#define ARITH_MULASSIGN 264
#define ARITH_DIVASSIGN 265
#define ARITH_REMASSIGN 266
#define ARITH_RSHASSIGN 267
#define ARITH_LSHASSIGN 268
#define ARITH_BANDASSIGN 269
#define ARITH_BXORASSIGN 270
#define ARITH_BORASSIGN 271
#define ARITH_OR 272
#define ARITH_AND 273
#define ARITH_BOR 274
#define ARITH_BXOR 275
#define ARITH_BAND 276
#define ARITH_EQ 277
#define ARITH_NE 278
#define ARITH_LT 279
#define ARITH_GT 280
#define ARITH_GE 281
#define ARITH_LE 282
#define ARITH_LSHIFT 283
#define ARITH_RSHIFT 284
#define ARITH_ADD 285
#define ARITH_SUB 286
#define ARITH_MUL 287
#define ARITH_DIV 288
#define ARITH_REM 289
#define ARITH_UNARYMINUS 290
#define ARITH_UNARYPLUS 291
#define ARITH_NOT 292
#define ARITH_BNOT 293
typedef union {
	arith_t l_value;
	char* s_value;
} YYSTYPE;
extern YYSTYPE yylval;
