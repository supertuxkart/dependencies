# Usage:
# cmake /path/to/src/folder -DMXE_PREFIX=/path/to/mxe -DCMAKE_TOOLCHAIN_FILE=/path/to/Toolchain-mxe-i686.cmake

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${MXE_PREFIX}/bin/i686-w64-mingw32.static.posix.dw2-gcc)
SET(CMAKE_CXX_COMPILER ${MXE_PREFIX}/bin/i686-w64-mingw32.static.posix.dw2-g++)
SET(CMAKE_RC_COMPILER ${MXE_PREFIX}/bin/i686-w64-mingw32.static.posix.dw2-windres)
SET(CMAKE_SYSTEM_PROCESSOR i686)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${PROJECT_SOURCE_DIR}/dependencies ${MXE_PREFIX}/i686-w64-mingw32.static.posix.dw2/ ${MXE_PREFIX}/lib/gcc/i686-w64-mingw32.static.posix.dw2/5.5.0/ ${CMAKE_INSTALL_PREFIX})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
