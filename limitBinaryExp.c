#include <stdio.h>
#include <stdlib.h>
#include <time.h>

float cLimitBinaryExp(int N, float valor);
extern float asmLimitBinaryExp(int N);

int main() {
    float variC,variASM,valor;
    int N = 5;
    struct timespec time1, time2;

    valor = (float) 1/N;
    valor += 1;

    variC = cLimitBinaryExp(N, valor);
    variASM = asmLimitBinaryExp(N);

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2);   
    double tC = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time1);
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &time2); 
    double tASM = (double)((time2.tv_sec-time1.tv_sec) + (time2.tv_nsec-time1.tv_nsec)/1e9);

    printf("El valor del limite en C es: %f\n",variC);
    printf("El valor del limite en ASM es: %f\n",variASM);

    printf("El tiempo de ejecución en C es: %.5f ms\n", tC*1e3);
    printf("El tiempo de ejecución en ASM es: %.5f ms\n", tASM*1e3);
    printf("El speed-up es: %.2f \n", tC/tASM);
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