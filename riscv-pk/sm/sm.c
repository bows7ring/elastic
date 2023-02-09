//******************************************************************************
// Copyright (c) 2018, The Regents of the University of California (Regents).
// All Rights Reserved. See LICENSE for license details.
//------------------------------------------------------------------------------
#include <string.h>
#include "sm.h"
#include "mtrap.h"
#include "pmp.h"
#include "atomic.h"
#include "crypto.h"
#include "enclave.h"
#include "platform.h"

static int sm_init_done = 0;
static int sm_region_id = 0, os_region_id = 0;
static spinlock_t sm_init_lock = SPINLOCK_INIT;

/* from Sanctum BootROM */
extern byte sanctum_sm_hash[MDSIZE];
extern byte sanctum_sm_signature[SIGNATURE_SIZE];
extern byte sanctum_sm_secret_key[PRIVATE_KEY_SIZE];
extern byte sanctum_sm_public_key[PUBLIC_KEY_SIZE];
extern byte sanctum_dev_public_key[PUBLIC_KEY_SIZE];

byte sm_hash[MDSIZE] = { 0, };
byte sm_signature[SIGNATURE_SIZE] = { 0, };
byte sm_public_key[PUBLIC_KEY_SIZE] = { 0, };
byte sm_private_key[PRIVATE_KEY_SIZE] = { 0, };
byte dev_public_key[PUBLIC_KEY_SIZE] = { 0, };

int osm_pmp_set(uint8_t perm)
{
    /* in case of OSM, PMP cfg is exactly the opposite.*/
    return pmp_set(os_region_id, perm);
}

int smm_init()
{
    int region = -1;
    // SM metadata,smm_size is pgsize algined
    // Top privilige doesn't allow overlap
    // So the last arg should to be 0.
    int ret = pmp_region_init_atomic(SMM_BASE, SMM_SIZE, PMP_PRI_TOP, &region, 0);
    if(ret)
        return -1;

    return region;
}
#define RISCV_PGSIZE (1 << RISCV_PGSHIFT)

int osm_init()
{
    int region = -1;
    int ret = pmp_region_init_atomic(0, -1UL, PMP_PRI_BOTTOM, &region, 1);
    if(ret)
        return -1;

    return region;
}

/*
    SM: 0x80000000 - 0x80200000
    OS: 0 - -1
*/


#define EPM1_BASE 0x00000000be000000
#define EPM2_BASE 0x00000000c1a00000
#define EPM_SIZE 0x381b000


// int EPM1_region_init() // TODO: tmp use this func to init first high pmp
// {
//     int region = -1;
//     int ret =  pmp_region_init_atomic(EPM1_BASE, EPM_SIZE, PMP_PRI_HIGH, &region, 1);
//         if(ret)
//         return -1;

//     return region;
// }

// int EPM2_region_init()
// {
//     int region = -1;
//     int ret =  pmp_region_init_atomic(EPM2_BASE, EPM_SIZE, PMP_PRI_ANY, &region, 1);
//         if(ret)
//         return -1;

//     return region;
// }

int Blocked_region_init()
{
    int region = -1; // all 
    int ret =  pmp_region_init_atomic(0x00000000be000000, 0x20000000, PMP_PRI_LOW, &region, 1);
        if(ret)
        return -1;

    return region;
}


void sm_sign(void* signature, const void* data, size_t len)
{
    sign(signature, data, len, sm_public_key, sm_private_key);
}

void sm_copy_key()
{
    memcpy(sm_hash, sanctum_sm_hash, MDSIZE);
    memcpy(sm_signature, sanctum_sm_signature, SIGNATURE_SIZE);
    memcpy(sm_public_key, sanctum_sm_public_key, PUBLIC_KEY_SIZE);
    memcpy(sm_private_key, sanctum_sm_secret_key, PRIVATE_KEY_SIZE);
    memcpy(dev_public_key, sanctum_dev_public_key, PUBLIC_KEY_SIZE);
}

void sm_init(void)
{
    // initialize SMM

    int EPM1_region_id = -1;
    int EPM2_region_id = -1;
    int Blocked_region_id = -1;

    spinlock_lock(&sm_init_lock);

    if(!sm_init_done) {
        sm_region_id = smm_init();
        if(sm_region_id < 0)
            die("[SM] intolerable error - failed to initialize SM memory");
    printm("sm_region_id:   %d\n",sm_region_id);


        os_region_id = osm_init();
        if(os_region_id < 0)
            die("[SM] intolerable error - failed to initialize OS memory");
    printm("os_region_id:   %d\n",os_region_id);

    
        /*EPM region test*/
        
        // EPM1_region_id = EPM1_region_init();
        // if(EPM1_region_id < 0)
        //     die("\nZZP DBG: EPM 1 region failed !\n");
        // printm("EPM 1_region_id: %d\n",EPM1_region_id);

        // EPM2_region_id = EPM2_region_init();
        // if(EPM2_region_id < 0)
        //     die("\nZZP DBG: EPM 2 region failed !\n");
        // printm("EPM 2_region_id: %d\n",EPM2_region_id);

        Blocked_region_id = Blocked_region_init();
        if(Blocked_region_id < 0)
            die("\nZZP DBG: Blocked_region failed !\n");
        printm("Blocked_region_id: %d\n",Blocked_region_id);



        sm_init_done = 1;


        if(platform_init_global_once() != ENCLAVE_SUCCESS)
            die("[SM] platform global init fatal error");
    }

    pmp_set(sm_region_id, PMP_NO_PERM);
    
    //  booting will fail, 
    //  unless test region is ALL_PREM
    // 
    // pmp_set(EPM1_region_id, PMP_NO_PERM);
    // pmp_set(EPM2_region_id, PMP_NO_PERM);
    pmp_set(Blocked_region_id, PMP_NO_PERM);
    printm("All the pre-set pmps succeed.\n\n");


    pmp_set(os_region_id, PMP_ALL_PERM);

    // ready to enter OS context now.

    /* Fire platform specific global init */
    if(platform_init_global() != ENCLAVE_SUCCESS)
        die("[SM] platform global init fatal error");

    // Copy the keypair from the root of trust
    sm_copy_key();

    // Init the enclave metadata
    enclave_init_metadata();

    spinlock_unlock(&sm_init_lock);

    return;
}
