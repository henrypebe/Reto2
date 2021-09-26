nasm -f elf64 -g limitBinaryExp.asm -o limitBinaryExp.o
gcc limitBinaryExp.o limitBinaryExp.c -o limitBinaryExp
gdb -x limitBinaryExp.gdb
./limitBinaryExp