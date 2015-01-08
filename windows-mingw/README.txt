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

If you want to have your game portable, after compilation you need to copy
libgcc_s_dw2-1.dll libstdc++-6.dll libgomp-1.dll and libwinpthread-1.dll
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
