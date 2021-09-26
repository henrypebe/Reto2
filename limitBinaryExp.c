#include <stdio.h>
#include <stdlib.h>

float cLimitBinaryExp(int N, float valor);
extern float asmLimitBinaryExp(int N);

int main() {
    float variC,variASM,valor;
    int N = 5;

    valor = (float) 1/N;
    valor += 1;

    variC = cLimitBinaryExp(N, valor);
    variASM = asmLimitBinaryExp(N);

    printf("El valor del limite en C es: %f\n",variC);
    printf("El valor del limite en ASM es: %f\n",variASM);

}

float cLimitBinaryExp(int N, float valor){
    int i;
    float num;
    /*i = N;
    num = (float) 1/N;
    num += 1;
    while(i>0){
        if(i%2 != 0) valor *= num;
        num *= num;
        i>>=1;
    }
    variC[0] = valor;*/

    if(N == 0) return 1;
    num = cLimitBinaryExp(N/2,valor);
    if(N%2!=0)
        return valor * num * num;
    return valor * valor;
}