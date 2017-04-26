#include "asm.h"
#include "asm_macros.h"
#include "spr.h"
.text
.align 2


MEM_AT(0x980)

b 0

/*
 * configuration structure.
 *
 * struct configuration {
 *     uint64_t hid0;
 *     uint64_t hid1_stage1;
 *     uint64_t hid1_stage2;
 *     uint64_t hid4_stage1;
 *     uint64_t hid4_stage2;
 *     uint64_t hid5;
 *     uint64_t hid6;
 *     uint64_t dccr;
 * };
 *
 */

config_0:
/*
 *  Rsvd_I0    = 0b1 Unknown 
 *  extr_hsrr  = 0b1 Enables extended external interrupt
 *  qattn_mode = 0b1 ATTN on one instruction also inactivates the other thread and causes it to go into maintenance.
 *  en_syserr  = 0b1 Enables system errors
 *  en_attn    = 0b1 Enables attention instruction (enable support processor attn instruction)
 */
    .quad 0x2000004b00000000 # hid0
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 */
    .quad 0x9c30100000000000 # hid1_stage1
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  flush_ic       = 0b1  Forces to flush the instruction cache. (status: 0 -> 1 -> 0 via sw, to flush icache)
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 */
    .quad 0x9e30100000000000 # hid1_stage2
/*
 *  Rsvd_I1      = 0b011 Unknown (Enables the L1 data cache (all) ?)
 *  dis_force_ci = 0b1   Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1   Use HID4[18] (aka: dis_force_ci)
 */
    .quad 0x0600300000000000 # hid4_stage1
/*
 *  Rsvd_I1      = 0b011 Unknown (Enables the L1 data cache (all) ?)
 *  l1dc_flsh    = 0b1   L1 data cache flash invalidate (all sectors)
 *  dis_force_ci = 0b1   Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1   Use HID4[18] (aka: dis_force_ci)
 */
    .quad 0x0680300000000000 # hid4_stage2
    .quad 0x0000000000000000 # hid5
/*
 *  LB   = 0b0   16MB page size  
 *  RMSC = 0b101 real address boundary at 4 Gigabyte
 */
    .quad 0x0000001400000000 # hid6
    .quad 0x0000000000000000 # dccr

config_1:
/*
 *  extr_hsrr  = 0b1 Enables extended external interrupt
 *  qattn_mode = 0b1 ATTN on one instruction also inactivates the other thread and causes it to go into maintenance.
 *  en_syserr  = 0b1 Enables system errors
 *  en_attn    = 0b1 Enables attention instruction (enable support processor attn instruction)
 */
    .quad 0x0000004b00000000 # hid0
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 *  en_i_prefetch  = 0b1  Enables instruction prefetch
 */
    .quad 0x9c30104000000000 # hid1_stage1
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  flush_ic       = 0b1  Forces to flush the instruction cache. (status: 0 -> 1 -> 0 via sw, to flush icache)
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 */
    .quad 0x9e30100000000000 # hid1_stage2
/*
 *  dis_force_ci = 0b1    Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1    Use HID4[18] (aka: dis_force_ci)
 *  en_dway      = 0b1111 Enables the L1 data cache (all)
 */
    .quad 0x00003f0000000000 # hid4_stage1
/*
 *  l1dc_flsh    = 0b1    L1 data cache flash invalidate (all sectors)
 *  dis_force_ci = 0b1    Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1    Use HID4[18] (aka: dis_force_ci)
 *  en_dway      = 0b1111 Enables the L1 data cache (all)
 */
    .quad 0x00803f0000000000 # hid4_stage2
    .quad 0x0000000000000000 # hid5
/*
 *  LB   = 0b0   16MB page size  
 *  RMSC = 0b101 real address boundary at 4 Gigabyte
 */
    .quad 0x0000001400000000 # hid6
    .quad 0x0000000000000000 # dccr

config_2:
/*
 *  extr_hsrr  = 0b1 Enables extended external interrupt
 *  qattn_mode = 0b1 ATTN on one instruction also inactivates the other thread and causes it to go into maintenance.
 *  en_syserr  = 0b1 Enables system errors
 *  en_attn    = 0b1 Enables attention instruction (enable support processor attn instruction)
 */
    .quad 0x0000004b00000000 # hid0
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 *  en_i_prefetch  = 0b1  Enables instruction prefetch
 */
    .quad 0x9c30104000000000 # hid1_stage1
/*
 *  bht_pm         = 0b1  The branch history table (BHT) is used for branch prediction
 *  en_ls          = 0b1  Enables link stack. All four entries of the link stack are used.
 *  en_icway       = 0b11 Cache enabled
 *  flush_ic       = 0b1  Forces to flush the instruction cache. (status: 0 -> 1 -> 0 via sw, to flush icache)
 *  en_if_cach     = 0b1  Enables instruction fetch cacheability control
 *  sel_cach_rule  = 0b1  Cacheability control rule: HID register
 *  dis_sysrst_reg = 0b1  Disable configuration ring system reset interrupt address register (jumps to 0x100)
 */
    .quad 0x9e30100000000000 # hid1_stage2
/*
 *  dis_force_ci = 0b1    Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1    Use HID4[18] (aka: dis_force_ci)
 *  en_dway      = 0b1111 Enables the L1 data cache (all)
 */
    .quad 0x00003f0000000000 # hid4_stage1
/*
 *  l1dc_flsh    = 0b1    L1 data cache flash invalidate (all sectors)
 *  dis_force_ci = 0b1    Use ERAT cache inhibit bit (normal translation).
 *  enb_force_ci = 0b1    Use HID4[18] (aka: dis_force_ci)
 *  en_dway      = 0b1111 Enables the L1 data cache (all)
 */
    .quad 0x00803f0000000000 # hid4_stage2
    .quad 0x0000000000000000 # hid5
/*
 *  LB   = 0b0   16MB page size  
 *  RMSC = 0b101 real address boundary at 4 Gigabyte
 */
    .quad 0x0000001400000000 # hid6
    .quad 0x0000000000000000 # dccr

/*
 * version structure.
 *
 * struct proc_versions {
 *     uint64_t version;
 *     void* config;
 * };
 *
 */
proc_versions:
    .quad 0x0000000000700000 # Version 7.0.0 (DECR ?)
    .quad config_0
    .quad 0x0000000000700100 # Version 7.1.0
    .quad config_0
    .quad 0x0000000000700101 # Version 7.1.1
    .quad config_0
    .quad 0x0000000000700400 # Version 7.4.0
    .quad config_1
    .quad 0x0000000000700500 # Version 7.5.0
    .quad config_2
    .quad 0x0000000000700501 # Version 7.5.1 (Super Slim?)
    .quad config_2
    .quad 0x0000000000000000
    .quad 0x0000000000000000
msrd_cfg:
/*
 *  SF = 0b1 64-bit mode
 *  HV = 0b1 processor is in hypervisor state (only if PR == 0)
 *  PR = 0b0 The processor is in privileged state (zero)
 */
    .quad 0x9000000000000000
lpcr_cfg:
/*
 *  RMI  = 0b1 Enables Real-mode caching
 *  LPES = 0b1 Enables Logical partitioning (environment selector)
 */
    .quad 0x0000000000000006
tscr_cfg:
/*
 *  FPCF     = 0b1     Forward progress count flush enabled
 *  DISP_CNT = 0b11111 Thread dispatch count (0x1F)
 */
    .long 0xF8040000
    .long 0

.text
ADDR_AT(0x100)              # start of Thread 0
    b initialize


initialize:
    li    r0, 0             # r0 = 0
    mfpvr r4                # r4 = processor version
    lw32  r5 proc_versions  # r5 = (void*)proc_versions
version_loop:
    ld    r6, (r5)          # r6 = (*r5)
    cmpd  r6, r4            # checks if the version is the same as one of proc_versions
    beq-  config_proc       # if(r6 == r4) goto config_proc
    cmpdi r6, 0             # checks if has reached the end of the array
    beq-  version_not_found # if(r6 == 0) goto version_not_found
    addi  r5, r5, 0x10      # r5 += 0x10
    b     version_loop
version_not_found:
    addi  r5, r5, -0x10     # r5 -= 0x10 ; Use config_2 as config
config_proc:
    ld    r3, lpcr_cfg(0)   # r3 = (*lpcr_cfg)
    mtspr SPRN_LPCR, r3     # SPRN_LPCR = r3
    isync                   # flushing istr cache
    slbia                   # slb invalidate all entries
    ld    r3, 8(r5)         # r3 = config_N
    ld    r4, 8(r3)         # r4 = configure.hid1_stage1
    lwsync                  # flushing load cache
    mtspr SPR_HID1, r4      # SPR_HID1 = r4 ; forcing to flush icache
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x18(r3)      # r4 = configure.hid4_stage1
    lwsync                  # flushing load cache
    mtspr SPR_HID4, r4      # SPR_HID4 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x10(r3)      # r4 = configure.hid1_stage2
    lwsync                  # flushing load cache
    mtspr SPR_HID1, r4      # SPR_HID1 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x20(r3)      # r4 = configure.hid4_stage2
    lwsync                  # flushing load cache
    mtspr SPR_HID4, r4      # SPR_HID4 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 8(r3)         # r4 = configure.hid1_stage2
    lwsync                  # flushing load cache
    mtspr SPR_HID1, r4      # SPR_HID1 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x18(r3)      # r4 = configure.hid4_stage1
    lwsync                  # flushing load cache
    mtspr SPR_HID4, r4      # SPR_HID4 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, (r3)          # r4 = configure.hid0
    lwsync                  # flushing load cache
    mtspr SPR_HID0, r4      # SPR_HID0 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x28(r3)      # r4 = configure.hid5
    lwsync                  # flushing load cache
    mtspr SPR_HID5, r4      # SPR_HID5 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x30(r3)      # r4 = configure.hid6
    lwsync                  # flushing load cache
    mtspr SPR_HID6, r4      # SPR_HID6 = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
    ld    r4, 0x38(r3)      # r4 = configure.dccr
    lwsync                  # flushing load cache
    mtdccr r4               # DCCR = r4
    lwsync                  # flushing load cache
    isync                   # flushing istr cache
//-------------------------------------------------------------//
    lwz    r4, tscr_cfg(0)  # r4 = (*tscr_cfg)
    mtspr  SPRN_TSCR, r4    # SPRN_TSCR = r4
    isync                   # flushing istr cache
    li     r4, 0            # r4 = 0
    isync                   # flushing istr cache
    mtspr  SPR_LPIDR, r4    # SPR_LPIDR = r4 (0)
    isync                   # flushing istr cache
    ld     r3, msrd_cfg(0)  # r3 = (*msrd_cfg)
    mtmsrd r3               # MSR = r3
    lw32   r3 0x080c6e80    # r3 = 0x080c6e80
    lw32   r4 0x080cbd80    # r4 = 0x080cbd80
    subf   r4, r3, r4       # r4 = 0xffffffffffffb100 = r3 - r4
    srdi   r4, r4, 7        # r4 >>= 7
    mtctr  r4               # ctr = r4 = 0x1ffffffffffff62
zeroing_loop:
    dcbz 0, r3              # zeroing sector from 0x080c6e80 to 0x080cbd80
    addi r3, r3, 0x80       # moving blocks of 128 bytes
    bdnz zeroing_loop       # keep looping till ctr is non zero
    lw32 r1 0x0bffff80      # r1 = 0x0bffff80 ; setting stack pointer
    lw32 r2 0x080cdde0      # r2 = 0x080cdde0 ; setting table of contents pointer
    lw32 r3 0x08000000      # r3 = 0x08000000 ; placing _main in order to jump there.
    mtlr r3                 # lr = r3
    blrl                    # jumps to 0x08000000

entry:
	.quad 0000000000000100