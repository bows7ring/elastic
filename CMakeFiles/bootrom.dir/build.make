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

# Utility rule file for bootrom.

# Include the progress variables for this target.
include CMakeFiles/bootrom.dir/progress.make

CMakeFiles/bootrom: bootrom.build
CMakeFiles/bootrom: bootrom
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building bootrom"
	$(MAKE) -C /home/zzp/keystone/elasticlave/bootrom O=/home/zzp/keystone/elasticlave/bootrom.build

bootrom.build:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating bootrom.build"
	mkdir -p /home/zzp/keystone/elasticlave/bootrom.build

bootrom: CMakeFiles/bootrom
bootrom: bootrom.build
bootrom: CMakeFiles/bootrom.dir/build.make

.PHONY : bootrom

# Rule to build all files generated by this target.
CMakeFiles/bootrom.dir/build: bootrom

.PHONY : CMakeFiles/bootrom.dir/build

CMakeFiles/bootrom.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bootrom.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bootrom.dir/clean

CMakeFiles/bootrom.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/bootrom.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bootrom.dir/depend

