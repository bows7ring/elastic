//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#ifndef _PMP_H_
#define _PMP_H_

#include "sm.h"
#include "mtrap.h"
#include "atomic.h"
#include <errno.h>
#include "sm_types.h"

#define PMP_N_REG         16 //number of PMP registers
#define PMP_MAX_N_REGION  32 //maximum number of PMP regions

#define SET_BIT(bitmap, n) (bitmap |= (0x1 << (n)))
#define UNSET_BIT(bitmap, n) (bitmap &= ~(0x1 << (n)))
#define TEST_BIT(bitmap, n) (bitmap & (0x1 << (n)))

enum pmp_priority {
  PMP_PRI_ANY,
  PMP_PRI_TOP,
  PMP_PRI_BOTTOM,
  PMP_PRI_HIGH,
  PMP_PRI_LOW
};

#define PMP_ALL_PERM  (PMP_W | PMP_X | PMP_R)
#define PMP_NO_PERM   0

#if __riscv_xlen == 64
# define LIST_OF_PMP_REGS  X(0,0)  X(1,0)  X(2,0)  X(3,0) \
                           X(4,0)  X(5,0)  X(6,0)  X(7,0) \
                           X(8,2)  X(9,2)  X(10,2) X(11,2) \
                          X(12,2) X(13,2) X(14,2) X(15,2)
# define PMP_PER_GROUP  8
#else
# define LIST_OF_PMP_REGS  X(0,0)  X(1,0)  X(2,0)  X(3,0) \
                           X(4,1)  X(5,1)  X(6,1)  X(7,1) \
                           X(8,2)  X(9,2)  X(10,2) X(11,2) \
                           X(12,3) X(13,3) X(14,3) X(15,3)
# define PMP_PER_GROUP  4
#endif

#define PMP_SET(n, g, addr, pmpc) \
{ uintptr_t oldcfg = read_csr(pmpcfg##g); \
  pmpc |= (oldcfg & ~((uintptr_t)0xff << (uintptr_t)8*(n%PMP_PER_GROUP))); \
  asm volatile ("la t0, 1f\n\t" \
                "csrrw t0, mtvec, t0\n\t" \
                "csrw pmpaddr"#n", %0\n\t" \
                "csrw pmpcfg"#g", %1\n\t" \
                ".align 2\n\t" \
                "1: csrw mtvec, t0 \n\t" \
                "sfence.vma\n\t"\
                : : "r" (addr), "r" (pmpc) : "t0"); \
}

#define PMP_UNSET(n, g) \
{ uintptr_t pmpc = read_csr(pmpcfg##g); \
  pmpc &= ~((uintptr_t)0xff << (uintptr_t)8*(n%PMP_PER_GROUP)); \
  asm volatile ("la t0, 1f \n\t" \
                "csrrw t0, mtvec, t0 \n\t" \
                "csrw pmpaddr"#n", %0\n\t" \
                "csrw pmpcfg"#g", %1\n\t" \
                "sfence.vma\n\t"\
                ".align 2\n\t" \
                "1: csrw mtvec, t0" \
                : : "r" (0), "r" (pmpc) : "t0"); \
}

#define PMP_ERROR(error, msg) {\
  printm("%s:" msg "\n", __func__);\
  return error; \
}

enum pmp_status{
  virtual,
  physical
};

/* PMP region type */
struct pmp_region
{
  uint64_t size;
  uint8_t addrmode;
  uintptr_t addr;
  int allow_overlap;
  int reg_idx;
  enum pmp_status pmp_vp;
};

/* external functions */

// vpmp
int pmp_is_physical(int rid);
int pmp_sleep(int region_idx);
int pmp_wake(int region_idx);
int pmp_expand(int region_idx, int arg1, int arg2);
int pmp_vritualization(int region_idx);

// old func
int pmp_region_init_atomic(uintptr_t start, uint64_t size, enum pmp_priority pri, region_id* rid, int allow_overlap);
int pmp_region_init(uintptr_t start, uint64_t size, enum pmp_priority pri, region_id* rid, int allow_overlap);
int pmp_region_free_atomic(region_id region);
int tmp_pmp_region_free_atomic(region_id region);
int pmp_set(region_id n, uint8_t perm);
int pmp_set_global(int region_idx, uint8_t perm, int self, uintptr_t mask);
int pmp_unset(region_id n);
int pmp_unset_global(region_id n);
int pmp_detect_region_overlap_atomic(uintptr_t base, uintptr_t size);
int pmp_shmem_update_global(int region, uintptr_t enclave_mask);
int pmp_terminate_global(uintptr_t enclave_mask);
void pmp_ipi_update(int* args);

uintptr_t pmp_region_get_addr(region_id i);
uint64_t pmp_region_get_size(region_id i);

#define SHARED2PMP_PERM(x) ((x) & 3)

#endif
