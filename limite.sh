nasm -f elf64 -g limite.asm -o limite.o
gcc limite.o limite.c -o limite
gdb -x limite.gdb
./limite