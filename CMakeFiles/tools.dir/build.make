# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/zzp/keystone/elasticlave

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/zzp/keystone/elasticlave

# Utility rule file for tools.

# Include the progress variables for this target.
include CMakeFiles/tools.dir/progress.make

CMakeFiles/tools: scripts
CMakeFiles/tools: scripts/run-qemu.sh
CMakeFiles/tools: scripts/test-qemu.sh
CMakeFiles/tools: scripts/travis.sh
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating scripts and tools"

scripts:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating scripts"
	mkdir -p /home/zzp/keystone/elasticlave/scripts

scripts/run-qemu.sh: scripts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating scripts/run-qemu.sh"
	cd /home/zzp/keystone/elasticlave/scripts && echo "      export HOST_PORT=\$${HOST_PORT:=\"\$$((3000 + RANDOM % 3000))\"};       echo \"**** Running QEMU SSH on port \$${HOST_PORT} ****\";       /home/zzp/keystone/elasticlave/qemu/riscv64-softmmu/qemu-system-riscv64       -m 2G       -nographic       -machine virt       -bios /home/zzp/keystone/elasticlave/bootrom.build/bootrom.bin       -kernel /home/zzp/keystone/elasticlave/riscv-pk.build/bbl       -append \"console=ttyS0 ro root=/dev/vda\"       -drive file=/home/zzp/keystone/elasticlave/buildroot.build/images/rootfs.ext2,format=raw,id=hd0       -device virtio-blk-device,drive=hd0       -netdev user,id=net0,net=192.168.100.1/24,dhcpstart=192.168.100.128,hostfwd=tcp::\$${HOST_PORT}-:22       -device virtio-net-device,netdev=net0" > run-qemu.sh
	cd /home/zzp/keystone/elasticlave/scripts && chmod +x run-qemu.sh

scripts/test-qemu.sh: scripts
scripts/test-qemu.sh: scripts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating scripts/test-qemu.sh"
	cp /home/zzp/keystone/elasticlave/scripts/test-qemu.sh /home/zzp/keystone/elasticlave/scripts

scripts/travis.sh: scripts
scripts/travis.sh: scripts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Generating scripts/travis.sh"
	cp /home/zzp/keystone/elasticlave/scripts/travis.sh /home/zzp/keystone/elasticlave/scripts

tools: CMakeFiles/tools
tools: scripts
tools: scripts/run-qemu.sh
tools: scripts/test-qemu.sh
tools: scripts/travis.sh
tools: CMakeFiles/tools.dir/build.make

.PHONY : tools

# Rule to build all files generated by this target.
CMakeFiles/tools.dir/build: tools

.PHONY : CMakeFiles/tools.dir/build

CMakeFiles/tools.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/tools.dir/cmake_clean.cmake
.PHONY : CMakeFiles/tools.dir/clean

CMakeFiles/tools.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/tools.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/tools.dir/depend

