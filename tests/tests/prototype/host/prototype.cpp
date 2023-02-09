//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include <getopt.h>
#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <pthread.h>
#include "keystone.h"
#include "report.h"
#include "rpc.h"
#include "test_dev_key.h"

#define OCALL_GET_SERVER_EID 7
#define OCALL_GET_RECORD_SIZE 8

#define ENCLAVE_MAX_COUNT 16

static Keystone* enclaves[ENCLAVE_MAX_COUNT];
static int enclave_n;
static size_t record_size;
static pid_t pid;

static void* slave_run(void* _d){
  printf("[ZZP-SDK]Slave running...\n\n");
	enclaves[1]->run();
  printf("[ZZP-SDK]Slave exited.\n\n");
}

static int get_record_size_handler(Keystone* encalve, void* buffer, struct shared_region* shared_region){
    struct edge_call* edge_call = (struct edge_call*)buffer;
	uintptr_t data_section = edge_call_data_ptr(shared_region);
	*(size_t*)data_section = record_size;
	if(edge_call_setup_ret(edge_call,
				(void*)data_section, sizeof(record_size), shared_region)){
		edge_call->return_data.call_status = CALL_STATUS_BAD_OFFSET;
	} else{
		edge_call->return_data.call_status = CALL_STATUS_OK;
	}
	return 0;
}

static int get_server_eid_handler(Keystone* enclave, void* buffer, struct shared_region* shared_region){
	struct edge_call* edge_call = (struct edge_call*)buffer;

	uintptr_t* data_section = (uintptr_t*)edge_call_data_ptr(shared_region);
	*data_section = enclaves[0]->getSID();

	if( edge_call_setup_ret(edge_call, (void*) data_section, \
				sizeof(int), shared_region)){
		edge_call->return_data.call_status = CALL_STATUS_BAD_PTR;
	}
	else{
		edge_call->return_data.call_status = CALL_STATUS_OK;
	}

	return 0;
}

int main(int argc, char* argv[])
{
  if(argc < 2)
	  return -1;
  record_size = atol(argv[1]);

  int self_timing = 0;
  int load_only = 0;

  size_t untrusted_size = 2*1024*1024;
  size_t freemem_size = 48*1024*1024;
  uintptr_t utm_ptr = (uintptr_t)DEFAULT_UNTRUSTED_PTR;


  // int encl_num = 2;
  // new EnclaveGroup();
  Keystone enclave1, enclave2, enclave3, enclave4, enclave5, enclave6, enclave7, enclave8, enclave9, enclave10;
  // for(int i = 0; i++; i < encl_num) {
    // enclaves[i] = 
  // }
  Params params;

  params.setFreeMemSize(freemem_size);
  params.setUntrustedMem(utm_ptr, untrusted_size);

  enclave1.init("prototype-e1.eapp_riscv", "eyrie-rt", params); // two identical enclaves
// #define alternate_paddr 0x381b000 + 0xbe000000

  printf("SDK: encl 1 init done!\n\n");
  fflush(stdout);
  enclave2.init("prototype-e2.eapp_riscv", "eyrie-rt", params);

  enclave3.init("prototype-e3.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher1, dispatcher2, dispatcher3;
	enclave1.registerOcallDispatch(&dispatcher1);
	RPCServerInit(&dispatcher1, &enclave1);
	dispatcher1.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[0] = &enclave1;

	enclave2.registerOcallDispatch(&dispatcher2);
	RPCClientInit(&dispatcher2, &enclave2);
	dispatcher2.register_call(OCALL_GET_SERVER_EID, get_server_eid_handler, NULL);
	dispatcher2.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[1] = &enclave2;

  enclave3.registerOcallDispatch(&dispatcher3);
	RPCServerInit(&dispatcher3, &enclave3);
	dispatcher3.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[2] = &enclave3;


  enclave4.init("prototype-e4.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher4;
  enclave4.registerOcallDispatch(&dispatcher4);
	RPCServerInit(&dispatcher4, &enclave4);
	dispatcher4.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[3] = &enclave4;

  enclave5.init("prototype-e5.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher5;
  enclave5.registerOcallDispatch(&dispatcher5);
	RPCServerInit(&dispatcher5, &enclave5);
	dispatcher5.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[4] = &enclave5;

  enclave6.init("prototype-e6.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher6;
  enclave6.registerOcallDispatch(&dispatcher6);
	RPCServerInit(&dispatcher6, &enclave6);
	dispatcher6.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[5] = &enclave6;

  enclave7.init("prototype-e7.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher7;
  enclave7.registerOcallDispatch(&dispatcher7);
	RPCServerInit(&dispatcher7, &enclave7);
	dispatcher7.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[6] = &enclave7;

  enclave8.init("prototype-e8.eapp_riscv", "eyrie-rt", params);

  DefaultEdgeCallDispatcher dispatcher8;
  enclave8.registerOcallDispatch(&dispatcher8);
	RPCServerInit(&dispatcher8, &enclave8);
	dispatcher8.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  enclaves[7] = &enclave8;



  enclave_n = 10;



  //enclave.registerNewMemHandler(new_mem_handler);


  // pthread_t slave_thread;
  // pthread_create(&slave_thread, 0, slave_run, NULL);
  
  enclaves[0]->run();
  enclaves[1]->run();

  // printf("[ZZP-SDK]Client running...\n\n");
  // pthread_join(slave_thread, NULL);
  enclaves[2]->run();

  // enclaves[3]->run();  

  // enclaves[4]->run();  

  // enclaves[5]->run();  
  // enclaves[6]->run();  
  // enclaves[7]->run();  




  // enclave9.init("prototype-e9.eapp_riscv", "eyrie-rt", params);

  // DefaultEdgeCallDispatcher dispatcher9;
  // enclave9.registerOcallDispatch(&dispatcher9);
	// RPCServerInit(&dispatcher9, &enclave9);
	// dispatcher9.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  // enclaves[8] = &enclave9;
  
  // enclave10.init("prototype-e10.eapp_riscv", "eyrie-rt", params);

  // DefaultEdgeCallDispatcher dispatcher10;
  // enclave10.registerOcallDispatch(&dispatcher10);
	// RPCServerInit(&dispatcher10, &enclave10);
	// dispatcher10.register_call(OCALL_GET_RECORD_SIZE, get_record_size_handler, NULL);
  // enclaves[9] = &enclave10;

  // enclaves[8]->run();  
  // enclaves[9]->run();  



















  // EnclaveGroup enclave_group;
  // enclave_group.addEnclave(&enclave1);
  // enclave_group.addEnclave(&enclave2);

  // //enclave_group.run();
  // enclave_group.run();
  // // enclave_group.DestroyGroup();

  

  return 0;
}
