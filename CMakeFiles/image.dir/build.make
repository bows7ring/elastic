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

# Utility rule file for image.

# Include the progress variables for this target.
include CMakeFiles/image.dir/progress.make

CMakeFiles/image: buildroot
CMakeFiles/image: buildroot.build/.config
CMakeFiles/image: overlay/root
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating image"
	$(MAKE) -s -C /home/zzp/keystone/elasticlave/buildroot RISCV=/home/zzp/keystone/elasticlave/riscv/ PATH=/home/zzp/keystone/elasticlave/riscv//bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/riscv64-linux/bin/ O=/home/zzp/keystone/elasticlave/buildroot.build
	riscv64-unknown-linux-gnu-objcopy -S -O binary --change-addresses -0x80000000 /home/zzp/keystone/elasticlave/riscv-pk.build/bbl /home/zzp/keystone/elasticlave/bbl.bin

buildroot.build/.config: conf/qemu_riscv64_virt_defconfig
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Configuring buildroot (overlay = /home/zzp/keystone/elasticlave/overlay)"
	mkdir -p /home/zzp/keystone/elasticlave/buildroot.build
	cp /home/zzp/keystone/elasticlave/conf/qemu_riscv64_virt_defconfig /home/zzp/keystone/elasticlave/buildroot.build/.config
	sed "s/^BR2_ROOTFS_OVERLAY=.*/BR2_ROOTFS_OVERLAY=\"\/home\/zzp\/keystone\/elasticlave\/overlay\"/g" -i /home/zzp/keystone/elasticlave/buildroot.build/.config
	$(MAKE) -s -C /home/zzp/keystone/elasticlave/buildroot RISCV=/home/zzp/keystone/elasticlave/riscv/ PATH=/home/zzp/keystone/elasticlave/riscv//bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/opt/riscv64-linux/bin/ O=/home/zzp/keystone/elasticlave/buildroot.build CROSS_COMPILE=riscv64-unknown-linux-gnu- olddefconfig

overlay/root:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating overlay/root"
	mkdir -p /home/zzp/keystone/elasticlave/overlay/root

image: CMakeFiles/image
image: buildroot.build/.config
image: overlay/root
image: CMakeFiles/image.dir/build.make

.PHONY : image

# Rule to build all files generated by this target.
CMakeFiles/image.dir/build: image

.PHONY : CMakeFiles/image.dir/build

CMakeFiles/image.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/image.dir/cmake_clean.cmake
.PHONY : CMakeFiles/image.dir/clean

CMakeFiles/image.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/image.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/image.dir/depend
