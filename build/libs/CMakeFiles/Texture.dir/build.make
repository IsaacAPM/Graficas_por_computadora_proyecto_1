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
include libs/CMakeFiles/Texture.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include libs/CMakeFiles/Texture.dir/compiler_depend.make

# Include the progress variables for this target.
include libs/CMakeFiles/Texture.dir/progress.make

# Include the compile flags for this target's objects.
include libs/CMakeFiles/Texture.dir/flags.make

libs/CMakeFiles/Texture.dir/Texture.cpp.o: libs/CMakeFiles/Texture.dir/flags.make
libs/CMakeFiles/Texture.dir/Texture.cpp.o: ../libs/Texture.cpp
libs/CMakeFiles/Texture.dir/Texture.cpp.o: libs/CMakeFiles/Texture.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object libs/CMakeFiles/Texture.dir/Texture.cpp.o"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT libs/CMakeFiles/Texture.dir/Texture.cpp.o -MF CMakeFiles/Texture.dir/Texture.cpp.o.d -o CMakeFiles/Texture.dir/Texture.cpp.o -c /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/Texture.cpp

libs/CMakeFiles/Texture.dir/Texture.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Texture.dir/Texture.cpp.i"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/Texture.cpp > CMakeFiles/Texture.dir/Texture.cpp.i

libs/CMakeFiles/Texture.dir/Texture.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Texture.dir/Texture.cpp.s"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs/Texture.cpp -o CMakeFiles/Texture.dir/Texture.cpp.s

# Object files for target Texture
Texture_OBJECTS = \
"CMakeFiles/Texture.dir/Texture.cpp.o"

# External object files for target Texture
Texture_EXTERNAL_OBJECTS =

libs/libTexture.so: libs/CMakeFiles/Texture.dir/Texture.cpp.o
libs/libTexture.so: libs/CMakeFiles/Texture.dir/build.make
libs/libTexture.so: libs/CMakeFiles/Texture.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library libTexture.so"
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Texture.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
libs/CMakeFiles/Texture.dir/build: libs/libTexture.so
.PHONY : libs/CMakeFiles/Texture.dir/build

libs/CMakeFiles/Texture.dir/clean:
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs && $(CMAKE_COMMAND) -P CMakeFiles/Texture.dir/cmake_clean.cmake
.PHONY : libs/CMakeFiles/Texture.dir/clean

libs/CMakeFiles/Texture.dir/depend:
	cd /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1 /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/libs /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs /home/isaacapm/Documents/Graficas_por_Computadora/Proyectos/Proyecto1/build/libs/CMakeFiles/Texture.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : libs/CMakeFiles/Texture.dir/depend

