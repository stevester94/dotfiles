**Basic Usage**
./linker.py link
- Will read filelist.txt and move and existing files to <filename>.bak, and create a symlink with the original name to the corresponding file in this dir

./linker.py unlink
- Will undo this process, moving the .bak file back to their original name
