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

# Utility rule file for qemu-pmp-bug.patch.

# Include the progress variables for this target.
include CMakeFiles/qemu-pmp-bug.patch.dir/progress.make

CMakeFiles/qemu-pmp-bug.patch:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Applying qemu-pmp-bug.patch"
	cd /home/zzp/keystone/elasticlave/qemu && patch --forward -p0 < /home/zzp/keystone/elasticlave/patches/qemu/qemu-pmp-bug.patch || true

qemu-pmp-bug.patch: CMakeFiles/qemu-pmp-bug.patch
qemu-pmp-bug.patch: CMakeFiles/qemu-pmp-bug.patch.dir/build.make

.PHONY : qemu-pmp-bug.patch

# Rule to build all files generated by this target.
CMakeFiles/qemu-pmp-bug.patch.dir/build: qemu-pmp-bug.patch

.PHONY : CMakeFiles/qemu-pmp-bug.patch.dir/build

CMakeFiles/qemu-pmp-bug.patch.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/qemu-pmp-bug.patch.dir/cmake_clean.cmake
.PHONY : CMakeFiles/qemu-pmp-bug.patch.dir/clean

CMakeFiles/qemu-pmp-bug.patch.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/qemu-pmp-bug.patch.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/qemu-pmp-bug.patch.dir/depend

