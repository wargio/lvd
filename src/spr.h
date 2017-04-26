#ifndef _PPC_SPR_H
#define _PPC_SPR_H

/* 
 * IBM Cell HID infos at: 
 * https://www-01.ibm.com/chips/techlib/techlib.nsf/techdocs/6ED822DD7E97D889872570B200607EEC/$file/CellBE_Registers_v1.51_18SEP2007.pdf
 */
 
#define SPR_MQ          0x0
#define SPR_XER         0x1
#define SPR_RTCU        0x4
#define SPR_RTCL        0x5
#define SPR_LR          0x8
#define SPR_CTR         0x9
#define SPR_DSISR       0x12
#define SPR_DAR         0x13
#define SPR_DEC         0x16
#define SPR_SDR1        0x19
#define SPR_SRR0        0x1a
#define SPR_SRR1        0x1b
#define SPR_VRSAVE      0x100
#define SPR_TBRL        0x10c
#define SPR_TBRU        0x10d
#define SPR_SPRG0       0x110
#define SPR_SPRG1       0x111
#define SPR_SPRG2       0x112
#define SPR_SPRG3       0x113
#define SPR_EAR         0x11a
#define SPR_TBL         0x11c
#define SPR_TBU         0x11d
#define SPR_PVR         0x11f
#define SPR_LPCR        0x13e /* LPAR Control Register */
#define SPR_LPIDR       0x13f /* LPAR Identity Register */
#define SPR_SPEFSCR     0x200
#define SPR_IBAT0U      0x210
#define SPR_IBAT0L      0x211
#define SPR_IBAT1U      0x212
#define SPR_IBAT1L      0x213
#define SPR_IBAT2U      0x214
#define SPR_IBAT2L      0x215
#define SPR_IBAT3U      0x216
#define SPR_IBAT3L      0x217
#define SPR_DBAT0U      0x218
#define SPR_DBAT0L      0x219
#define SPR_DBAT1U      0x21a
#define SPR_DBAT1L      0x21b
#define SPR_DBAT2U      0x21c
#define SPR_DBAT2L      0x21d
#define SPR_DBAT3U      0x21e
#define SPR_DBAT3L      0x21f
#define SPR_TAR         0x32f /* Target Address Register */
#define SPR_TSC         0x399
#define SPR_UMMCR0      0x3a8
#define SPR_UMMCR1      0x3ac
#define SPR_UPMC1       0x3a9
#define SPR_UPMC2       0x3aa
#define SPR_USIA        0x3ab
#define SPR_UPMC3       0x3ad
#define SPR_UPMC4       0x3ae
#define SPR_MMCR0       0x3b8
#define SPR_PMC1        0x3b9
#define SPR_PMC2        0x3ba
#define SPR_SIA         0x3bb
#define SPR_MMCR1       0x3bc
#define SPR_PMC3        0x3bd
#define SPR_PMC4        0x3be
#define SPR_SDA         0x3bf
#define SPR_DMISS       0x3d0
#define SPR_DCMP        0x3d1
#define SPR_HASH1       0x3d2
#define SPR_HASH2       0x3d3
#define SPR_IMISS       0x3d4
#define SPR_ICMP        0x3d5
#define SPR_RPA         0x3d6
#define SPR_HID0        0x3f0 /* Hardware Implementation Register 0 */
#define SPR_HID1        0x3f1 /* Hardware Implementation Register 1 */
#define SPR_IABR        0x3f2
#define SPR_HID2        0x3f3 /* Hardware Implementation Register 2 */
#define SPR_HID4        0x3f4 /* Hardware Implementation Register 4 */
#define SPR_DABR        0x3f5
#define SPR_HID5        0x3f6 /* Hardware Implementation Register 5 */
#define SPR_HID6        0x3f9 /* Hardware Implementation Register 6 */
//#define SPR_L2CR        0x3f9
#define SPR_ICTC        0x3fb
#define SPR_THRM1       0x3fc
#define SPR_THRM2       0x3fd
#define SPR_THRM3       0x3fe
#define SPR_PIR         0x3ff

#endif /* _PPC_SPR_H */