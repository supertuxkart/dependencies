# Usage:
# cmake /path/to/src/folder -DLLVM_ARCH=aarch64 i686 or x86_64 -DLLVM_PREFIX=/path/to/llvm-mingw-prefix -DCMAKE_TOOLCHAIN_FILE=/path/to/Toolchain-llvm-mingw.cmake

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-clang)
SET(CMAKE_CXX_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-clang++)
SET(CMAKE_RC_COMPILER ${LLVM_PREFIX}/bin/${LLVM_ARCH}-w64-mingw32-windres)
SET(CMAKE_SYSTEM_PROCESSOR ${LLVM_ARCH})
SET(CMAKE_BUILD_TYPE RelWithDebInfo)
SET(CMAKE_SHARED_LINKER_FLAGS "-static-libgcc -lc++ -Wl,-pdb=")
# See https://github.com/llvm/llvm-project/issues/64278
if(LLVM_ARCH MATCHES "x86_64" OR LLVM_ARCH MATCHES "i686")
  SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -gcodeview")
  SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -gcodeview")
endif()

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${LLVM_PREFIX}/generic-w64-mingw32 ${LLVM_PREFIX}/${LLVM_ARCH}-w64-mingw32/bin ${CMAKE_INSTALL_PREFIX})

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
