#!/usr/bin/python3
# CMAKE_MACOSX_RPATH no longer works for some reason
import os
import sys
for path, dirs, files in os.walk('.'):
    for filename in files:
        fullpath = os.path.join(path, filename)
        with open(fullpath, 'rb') as f:
            data = f.read()
            str = '-install_name ' + sys.argv[1]
            search = str.encode('utf-8')
            if search in data:
                data = data.replace(search, b'-install_name @rpath')
                f.close()
                with open(fullpath, 'wb') as f:
                    f.write(data)
