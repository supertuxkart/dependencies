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
http://sourceforge.net/projects/mingw-w64/files/latest/download

Install it in "c:\MinGW" directory using default settings.

Add path to compiler to your PATH environment variable.
- Run to: My Computer -> Properties -> Advanced system settings ->
  -> Environment variables
- Look at system variables and find there PATH variable
- It will look for example:
  "c:\MinGW\bin;C:\Program Files\CMake\bin;%SystemRoot%\system32;%SystemRoot%"

You should also add there path to cmake tool for more comfortable work. Note
that you cannot have there path to cygwin directory at the same time.

Open build directory in terminal and use cmake:
    cmake .. -G "MinGW Makefiles"

If cmake didn't show any errors, you can use:
    mingw32-make

Now you should be able to execute binary:
- open stk-code directory in terminal
- run build\bin\supertuxkart.exe

If you want to install game in Program Files directory, you can use:
    mingw32-make install

================================================================================

You can also use this package to cross-compile Windows binary under Linux. To
do it, just open your build directory and use:

    cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/Toolchain-mingw.cmake

Note that this toolchain file is prepared for Ubuntu 14.10. It may or may not
work with other distributions. You also need MinGW compiler (can be downloaded
from Ubuntu repositories).
