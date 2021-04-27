# Usage:
# cmake /path/to/src/folder -DMXE_PREFIX=/path/to/mxe -DCMAKE_TOOLCHAIN_FILE=/path/to/Toolchain-mxe-x86_64.cmake

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${MXE_PREFIX}/bin/x86_64-w64-mingw32.static.posix.seh-gcc)
SET(CMAKE_CXX_COMPILER ${MXE_PREFIX}/bin/x86_64-w64-mingw32.static.posix.seh-g++)
SET(CMAKE_RC_COMPILER ${MXE_PREFIX}/bin/x86_64-w64-mingw32.static.posix.seh-windres)
SET(CMAKE_SYSTEM_PROCESSOR x86_64)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${PROJECT_SOURCE_DIR}/dependencies ${MXE_PREFIX}/x86_64-w64-mingw32.static.posix.seh/ ${MINGW_PREFIX}/lib/gcc/x86_64-w64-mingw32.static.posix.seh/5.5.0/ ${CMAKE_INSTALL_PREFIX})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
