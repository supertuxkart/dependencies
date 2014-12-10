This subdirectory includes all files necessary to compile SuperTuxKart with gcc
or clang compiler on Windows.

Copy these files into the SuperTuxKart code directory (so that the directory
'dependencies' is next to src and data). This dependency package also includes
the necessary .dll files which are needed to run the game.

Source tree should look as follow:
> supertuxkart
  > stk-assets
    > karts
    > tracks
    > ...
  > stk-code
    > build
    > data
    > dependencies
    > src
    > ...

================================================================================

Here is some info how to compile STK on Windows using gcc:

Download MinGW installer:
https://sourceforge.net/projects/mingw/files/latest/download

Install it and add path to compiler to your PATH environment variable.
- Run to: My Computer -> Properties -> Advanced system settings ->
  -> Environment variables
- Look at system variables and find there PATH variable
- Add there path to compiler. It will look for example:
  "c:\MinGW\bin;C:\Program Files\CMake\bin;%SystemRoot%\system32;%SystemRoot%"

You should also add there path to cmake tool for more comfortable work. Note
that you cannot have there path to cygwin directory at the same time.

Open c:\mingw\bin directory in terminal and run:
    mingw-get update
    mingw-get install gcc-g++ gcc-core mingw32-base mingw32-make pthreads
                      mingw-utils binutils gmp mpc mpfr libiconv zlib

You can also try to use compiler from Code Blocks IDE. It probably doesn't
support OpenMP, but it should work.

Open build directory in terminal and use cmake:
    cmake .. -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Debug

Current gcc version has a bug and it crashes (at least for me) during
compilation of bullet in release mode. It's because you need to compile it in
debug mode. If you have already MinGW configured properly, you can use Clang for
release mode compilation ;)

If cmake didn't show any errors, you can use:
    mingw32-make

After compilation you need to copy libgcc_s_dw2-1.dll and libstdc++-6.dll
libraries from your compiler path to build\bin folder. They are not included in
dependencies because they are compiler-specific files. Other files should be
already copied to bin directory.

Now you should be able to execute binary:
- open stk-code directory in terminal
- run build\bin\supertuxkart.exe

You can also copy all needed files to one directory. It should have following
structure:
> supertuxkart
  > data   (copied from stk-code\data)
    > gfx
    > gui
    > karts   (copied from stk-assets)
    > tracks   (copied from stk-assets)
    > ...
  > supertuxkart.exe   (copied from build\bin)
  > *.dll   (copied from build\bin)

Make install is not supported atm. (it won't install .dll files).

--------------------

To compile application in release mode (to workaround gcc bug) you can use
clang. You can download it from there:
http://llvm.org/releases/3.5.0/LLVM-3.5.0-win32.exe

You can simply set following environment variables before run cmake.
Run in terminal:
    set CC=clang
    set CXX=clang++
    cmake .. -G "MinGW Makefiles"

Note that in this case you need to have also path to clang in PATH environment
variable. You must also use clean build directory to do it. Anyway you need gcc
because it is used as a linker and executable depends on libgcc and libstdc++
libraries.
