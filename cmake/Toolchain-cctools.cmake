# Usage:
# cmake /path/to/src/folder -DCCTOOLS_PREFIX=/path/to/cctools -DCCTOOLS_ARCH=arch -DCCTOOLS_PLATFORM=platform -DCMAKE_TOOLCHAIN_FILE=/path/to/Toolchain-cctools.cmake

# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Darwin)

# which compilers to use for C and C++
string(TOLOWER "${CCTOOLS_PLATFORM}" platform_lower)
set(CLANG_ARCH ${CCTOOLS_ARCH})
if(CCTOOLS_ARCH MATCHES ^arm)
  set(CLANG_ARCH arm)
else()
  set(CLANG_ARCH ${CCTOOLS_ARCH})
endif()

if (NOT CCTOOLS_PLATFORM MATCHES MacOSX)
  set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fembed-bitcode")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fembed-bitcode")
endif()

SET(CMAKE_C_COMPILER ${CCTOOLS_PREFIX}/bin/${CCTOOLS_ARCH}-${platform_lower}-clang)
SET(CMAKE_CXX_COMPILER ${CCTOOLS_PREFIX}/bin/${CCTOOLS_ARCH}-${platform_lower}-clang++)
SET(CMAKE_RANLIB ${CCTOOLS_PREFIX}/bin/${CLANG_ARCH}-apple-darwin11-ranlib)
SET(CMAKE_AR ${CCTOOLS_PREFIX}/bin/${CLANG_ARCH}-apple-darwin11-ar)
SET(CMAKE_INSTALL_NAME_TOOL ${CCTOOLS_PREFIX}/bin/${CLANG_ARCH}-apple-darwin11-install_name_tool)
SET(CMAKE_SYSTEM_PROCESSOR ${CCTOOLS_ARCH})
SET(CMAKE_MACOSX_RPATH TRUE)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${CMAKE_INSTALL_PREFIX} ${CCTOOLS_PREFIX}/sdk/${CCTOOLS_PLATFORM}.sdk)

# adjust the default behaviour of the FIND_XXX() commands:
# search headers and libraries in the target environment, search
# programs in the host environment
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ALWAYS)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
