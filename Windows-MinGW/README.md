# SuperTuxKart compilation with MinGW

This subdirectory includes all files necessary to compile SuperTuxKart with the 
gcc compiler on Windows.

Copy these files into the SuperTuxKart code directory (so that the directories 
`dependencies-mingw-64bit` and `dependencies-mingw` are next to `src` and `data`). 
This dependency package also includes the necessary .dll files which are needed 
to run the game.

The source tree should look as follows:

> supertuxkart
  > stk-assets
    > karts
    > tracks
    > ...
  > stk-code
    > build
    > data
    > dependencies-mingw-64bit (dependencies-mingw for 32-bit version) 
    > src
    > ...

================================================================================

## MinGW compilation on Windows

Here is some info how to compile STK on Windows using gcc:

Download the MinGW installer:

https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/installer/mingw-w64-install.exe

Install it in "c:\MinGW" directory, and select the latest version and revision, 
and "posix" threads.  For 64-bit builds, select "x86_64" arch and "seh" 
exceptions.  For 32-bit builds, select "i686" arch and "sjlj" exceptions.

Next, add the path to the compiler and CMake bin to your PATH environment 
variable.

- Run to: My Computer -> Properties -> Advanced system settings ->
  -> Environment variables
- Look at system variables and find the PATH variable
- Add the paths. It should look something like this:

```
"C:\MinGW\mingw64\bin;C:\Program Files\CMake\bin;%SystemRoot%\system32;%SystemRoot%"
```

For 32-bit MinGW, replace `C:\MinGW\mingw64\bin;` with `C:\MinGW\mingw32\bin;`.

Note that the path cannot include the cygwin directory at the same time.

Open build directory in terminal and use cmake:

    cmake .. -G "MinGW Makefiles"

If cmake didn't show any errors, you can use:

    mingw32-make

Now you should be able to execute the binary:

- Open the `stk-code` directory in terminal
- Run `build\bin\supertuxkart.exe`

If you want to install the game in the Program Files directory, you can use:

    mingw32-make install

================================================================================

## MinGW cross-compilation on Linux

You can also use this package to cross-compile a Windows binary under Linux. To 
do it, just open your build directory and use:

    cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/Toolchain-mingw-64bit.cmake

For 32-bit builds:

    cmake .. -DCMAKE_TOOLCHAIN_FILE=../cmake/Toolchain-mingw.cmake

Note that this toolchain file is prepared for Ubuntu, so it may or may not 
work with other distributions. You also need the MinGW compiler, which can be 
downloaded from the Ubuntu repositories. To install it, run:

    sudo apt install gcc-mingw-w64 g++-mingw-w64 binutils-mingw-w64 mingw-w64-tools
