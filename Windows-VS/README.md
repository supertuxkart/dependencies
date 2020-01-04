## SuperTuxKart compilation with VS

This subdirectory contains all necessary dependencies to compile 
SuperTuxKart with Visual Studio 2013 or later (including the free 
express version).

Unzip these files into the SuperTuxKart code directory (so that 
the directories `dependencies-vs` and `dependencies-vs-64bit` 
are next to `src` and `data`). This zip file also includes the 
necessary .dll files which are needed to run the game.

The source tree should look as follows:

- `supertuxkart`
  - `stk-assets`
    - `karts`
    - `tracks`
    - ...
  - `stk-code`
    - `build`
    - `data`
    - `dependencies-vs-64bit` (`dependencies-vs` for a 32-bit build)
    - `src`
    - ...
