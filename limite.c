#include <stdio.h>
#include <stdlib.h>

void cLimite(int N, float *variC);
extern void asmLimite(int N, float *variASM);

int main() {
    float variC,variASM;
    int N = 1000000;

    cLimite(N, &variC);
    asmLimite(N, &variASM);

    printf("El valor del limite en C es: %f\n",variC);
    printf("El valor del limite en ASM es: %f\n",variASM);

}

void cLimite(int N, float *variC){
    int i;
    float num,valor=1;
    if(N<100000){
        num = (float) 1/N;
        num = 1 + num;
        for(i=0;i<N;i++) valor *= num;
    }else{
        valor = 2.71828;
    }
    variC[0] = valor;
}