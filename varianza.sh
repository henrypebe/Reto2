nasm -f elf64 -g varianza.asm -o varianza.o
gcc varianza.o varianza.c -o varianza
gdb -x varianza.gdb
./varianza