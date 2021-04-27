export PATH=$PATH:$HOME/llvm-mingw/bin
make_implib()
{
    local machine=$1 dll="$2" dllname deffile libfile

    dllname="${dll##*/}"
    deffile="${dll%.dll}.def"
    libfile="${dll%.dll}.lib"

    # Extract exports from the .edata section, writing results to the .def file.
    symbols=$(llvm-objdump -p "$dll" | awk '/Ordinal/,0 '|tail -n +3|awk '{print $3}')
    if [[ -z "$symbols" ]]; then
        echo "No symbols found"
        exit -1
    fi
    echo "LIBRARY $dllname" > "$deffile"
    echo "EXPORTS" >> "$deffile"
    echo "$symbols" >> "$deffile"

    # Create .lib suitable for MSVC. Cannot use binutils dlltool as that creates
    # an import library (like the one found in lib/*.dll.a) that results in
    # broken executables. For example, assume executable foo.exe that uses fnA
    # (from liba.dll) and fnB (from libb.dll). Using link.exe (14.00.24215.1)
    # with these broken .lib files results in an import table that lists both
    # fnA and fnB under both liba.dll and libb.dll. Use of llvm-dlltool creates
    # the correct archive that uses Import Headers (like official MS tools).
    llvm-dlltool -m "$machine" -d "$deffile" -l "$libfile"
    rm -f "$deffile"
}

make_implib $1 $2
