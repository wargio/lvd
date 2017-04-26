#ifndef _ASM_MACRO_PPC_H
#define _ASM_MACRO_PPC_H

#include "asm.h"

#define MEM_AT(addr)                       .=(addr)


/* Load Word 32 bit */
.macro  lw32 reg, value
lis \reg, \value@h
ori \reg, \reg, \value@l
.endm

/* Load Word 64 bit */
.macro  lw64 reg, value
lis \reg, \value@highest
ori \reg, \reg, \value@higher
sldi \reg, \reg, 32
oris \reg, \reg, \value@h
ori \reg, \reg, \value@l
.endm

#endif /* _ASM_MACRO_PPC_H */