set history filename ~/.gdb_history
set history save on
target remote :3001
set auto-load safe-path /
# set riscv use_compressed_breakpoints no
dir ./riscv-pk/sm/
set print pretty on
#b *0x80000000
#b create_enclave
b run_enclave
disp /4i $pc-4
