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

# Utility rule file for run-tests.

# Include the progress variables for this target.
include CMakeFiles/run-tests.dir/progress.make

CMakeFiles/run-tests:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/zzp/keystone/elasticlave/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running tests"
	./scripts/travis.sh /home/zzp/keystone/elasticlave/tests

run-tests: CMakeFiles/run-tests
run-tests: CMakeFiles/run-tests.dir/build.make

.PHONY : run-tests

# Rule to build all files generated by this target.
CMakeFiles/run-tests.dir/build: run-tests

.PHONY : CMakeFiles/run-tests.dir/build

CMakeFiles/run-tests.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run-tests.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run-tests.dir/clean

CMakeFiles/run-tests.dir/depend:
	cd /home/zzp/keystone/elasticlave && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave /home/zzp/keystone/elasticlave/CMakeFiles/run-tests.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run-tests.dir/depend

