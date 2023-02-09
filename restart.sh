sudo ps -ef | grep qemu-system-ris | grep -v grep | awk '{print "sudo kill "$2}' | sh

