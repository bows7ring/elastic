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

# Utility rule file for sm.

# Include the progress variables for this target.
include CMakeFiles/sm.dir/progress.make

CMakeFiles/sm: riscv-pk
CMakeFiles/sm: riscv-pk.build
CMakeFiles/sm: linux.build/vmlinux-stripped
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building sm"
	cd /home/zzp/keystone/elasticlave/riscv-pk.build && ln -rsnf /home/zzp/keystone/elasticlave/riscv-pk/sm_c /home/zzp/keystone/elasticlave/riscv-pk/sm
	cd /home/zzp/keystone/elasticlave/riscv-pk.build && /home/zzp/keystone/elasticlave/riscv-pk/configure --host=riscv64-unknown-linux-gnu --with-payload=/home/zzp/keystone/elasticlave/linux.build/vmlinux-stripped --enable-logo --with-logo=/home/zzp/keystone/elasticlave/conf/sifive_logo.txt --enable-sm --with-target-platform=default
	cd /home/zzp/keystone/elasticlave/riscv-pk.build && env CFLAGS=' -mabi=lp64d -march=rv64imafdc' $(MAKE) -C /home/zzp/keystone/elasticlave/riscv-pk.build

riscv-pk.build:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating riscv-pk.build"
	mkdir -p /home/zzp/keystone/elasticlave/riscv-pk.build

sm: CMakeFiles/sm
sm: riscv-pk.build
sm: CMakeFiles/sm.dir/build.make

.PHONY : sm

# Rule to build all files generated by this target.
CMakeFiles/sm.dir/build: sm

.PHONY : CMakeFiles/sm.dir/build

CMakeFiles/sm.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sm.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sm.dir/clean

CMakeFiles/sm.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/sm.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sm.dir/depend

