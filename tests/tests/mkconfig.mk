OUTPUT_DIR=$(KEYSTONE_SDK_DIR)/../build/overlay/root/
TESTS=iozone
EXTRA_TESTS=icall-server prototype#inter-enclave-call #lock#icall-server icall-proxy-3 icall-consumer icall-proxy-3-baseline icall-server lock-spatial lock-futex lock-spatial lock-futex lock lock-futex
EXTRA_PACKS=

