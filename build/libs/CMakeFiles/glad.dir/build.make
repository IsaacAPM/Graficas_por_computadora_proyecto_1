# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
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
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build

# Include any dependencies generated for this target.
include libs/CMakeFiles/glad.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/CMakeFiles/glad.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/CMakeFiles/glad.dir/progress.make

# Include the compile flags for this target's objects.
include libs/CMakeFiles/glad.dir/flags.make

libs/CMakeFiles/glad.dir/glad.c.o: libs/CMakeFiles/glad.dir/flags.make
libs/CMakeFiles/glad.dir/glad.c.o: ../libs/glad.c
libs/CMakeFiles/glad.dir/glad.c.o: libs/CMakeFiles/glad.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object libs/CMakeFiles/glad.dir/glad.c.o"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT libs/CMakeFiles/glad.dir/glad.c.o -MF CMakeFiles/glad.dir/glad.c.o.d -o CMakeFiles/glad.dir/glad.c.o -c /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/glad.c

libs/CMakeFiles/glad.dir/glad.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/glad.dir/glad.c.i"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/glad.c > CMakeFiles/glad.dir/glad.c.i

libs/CMakeFiles/glad.dir/glad.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/glad.dir/glad.c.s"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/glad.c -o CMakeFiles/glad.dir/glad.c.s

# Object files for target glad
glad_OBJECTS = \
"CMakeFiles/glad.dir/glad.c.o"

# External object files for target glad
glad_EXTERNAL_OBJECTS =

libs/libglad.so: libs/CMakeFiles/glad.dir/glad.c.o
libs/libglad.so: libs/CMakeFiles/glad.dir/build.make
libs/libglad.so: libs/CMakeFiles/glad.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library libglad.so"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/glad.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/CMakeFiles/glad.dir/build: libs/libglad.so
.PHONY : libs/CMakeFiles/glad.dir/build

libs/CMakeFiles/glad.dir/clean:
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && $(CMAKE_COMMAND) -P CMakeFiles/glad.dir/cmake_clean.cmake
.PHONY : libs/CMakeFiles/glad.dir/clean

libs/CMakeFiles/glad.dir/depend:
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1 /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs/CMakeFiles/glad.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/CMakeFiles/glad.dir/depend
