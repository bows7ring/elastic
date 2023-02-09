set timeout
sudo ./local-qemu-gdb.sh  expect {"buildroot login:" {send "root\n"} "assword:"{send "sifive\n"}} 
interact
