//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include<stdio.h>
// Multiclave Ecall
#define SBI_SM_MULTICLAVE_ECALL_PMP_UNLOCK 130
#define SBI_SM_MULTICLAVE_ECALL_PMP_LOCK 131
#define SBI_SM_MULTICLAVE_ECALL_PMP_EXPAND 132


/* don't want to taint asm/sbi.h, so just copied SBI_CALL and increased # args */

typedef unsigned long uintptr_t;

#define _SBI_CALL(which, arg0, arg1, arg2, arg3, arg4, arg5) ({			\
	register uintptr_t a0 asm ("a0") = (uintptr_t)(arg0);	\
	register uintptr_t a1 asm ("a1") = (uintptr_t)(arg1);	\
	register uintptr_t a2 asm ("a2") = (uintptr_t)(arg2);	\
	register uintptr_t a3 asm ("a3") = (uintptr_t)(arg3);	\
	register uintptr_t a4 asm ("a4") = (uintptr_t)(arg4);	\
	register uintptr_t a5 asm ("a5") = (uintptr_t)(arg5);	\
	register uintptr_t a7 asm ("a7") = (uintptr_t)(which);	\
	asm volatile ("ecall"					\
		      : "+r" (a0)				\
		      : "r" (a1), "r" (a2), "r" (a3), "r" (a4), "r"(a5), "r" (a7)		\
		      : "memory");				\
	a0;							\
})

#define SBI_CALL_3(which, arg0, arg1, arg2) _SBI_CALL(which,arg0, arg1, arg2, 0, 0, 0)


int main(){

//   printf("\n\t\t---------------\n\t\t****Hello 3****\n\t\t---------------\n\n\n");
//   fflush(stdout);

// /* epm2: [ c1400000 ~ c1400000 + 03300000 ] */
// /* this epm: [ c4800000 ~ c4800000 + 03300000 ]*/


	// unsigned long test = 0xdeadbeef;
	// printf("\n local W TEST\n");
	// // pa = ((vaddr - runtime_base) + epm_base)
	// printf("Data in this enclave: %lx, vaddr is: %lx, paddr is: %lx\n", 
	// 	test, &test, &test - 0xffffffff00000000 + 0xc4800000);
	// fflush(stdout);

	// unsigned int *ptr_in_other_encl = (unsigned int *)(0xc1800000 - 0xc4800000 + 0xffffffff00000000); 
	// printf("Data in another enclave: %lx, addr is %lx\n",
	// 	*ptr_in_other_encl, ptr_in_other_encl);	// illegal read
	// perror("ILLEGAL R TEST\n");

	// *ptr_in_other_encl = 0x11111111; 			// illegal write
	// perror("ILLEGAL W TEST\n");

	// void (* func_in_other_encl)(void);
	// func_in_other_encl = (void (*)()) (0xc1800000 - 0xc4800000 + 0xffffffff00000000);
	// func_in_other_encl(); 						// illegal execution
	// perror("ILLEGAL X TEST\n");

//   printf("before sbicall\n\n");
//   fflush(stdout);

//   // SBI_CALL_3(SBI_SM_MULTICLAVE_ECALL_PMP_EXPAND, 5,0,0); // i guess it's region {5}

  printf("\n\t\t---------------\n\t\t****Hello 3****\n\t\t---------------\n");
  fflush(stdout);

//   printf("[%s]:%s:%d\n\n",__FILE__, __func__, __LINE__);
  _exit(0);

  return 0;
}

