This subdirectory contains packed sources of libraries that are used in STK and
that are not included in the stk-code repository. They precisely are:
 - Curl
 - Freetype
 - Fribidi
 - Harfbuzz
 - Ifaddrs
 - Libogg
 - Libvorbis
 - Openal
 - Openssl

These libraries are compiled and then statically linked with STK by the Android
build script.

You need to extract this packed file to stk-code/lib directory, so that the
directory will have following structure:
> stk-code
  > build
  > data
  > lib
    > angelscript
    > bullet
    > curl
    > enet
    > freetype
    > ...
  > src
  > ...
