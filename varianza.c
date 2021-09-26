#include <stdio.h>
#include <stdlib.h>

extern void asmVarianza(float *v1, int N, float *variASM);
void cVarianza(float *v1, int N,float *variC);
float calcular_promedio(float *v1,int N);

int main() {
    float *v1, variC,variASM;
    int N = 5;

    v1 = malloc(N * sizeof(float));

    int i = 0;

    for(i = 0; i < N; i++){
		v1[i] = (float)i+1;
	}

    cVarianza(v1, N, &variC);
    asmVarianza(v1, N, &variASM);

    printf("El valor de la varianza en C es: %f\n",variC);
    printf("El valor de la varianza en ASMa es: %f\n",variASM);

}

void cVarianza(float *v1, int N,float *variC){
    int i = 0;
	float mult = 0,sum=0,promedio;

    promedio = calcular_promedio(v1,N);

    for(i = 0; i < N; i++){
		mult = v1[i] - promedio;
        mult *= mult;
        sum += mult;
	}
    sum /= N;
    variC[0] = sum;
}

float calcular_promedio(float *v1,int N){
    float promedio=0,cont=0;
    int i;
    for(i = 0; i < N; i++){
		promedio += v1[i];
        cont++;
	}
    promedio /= cont;
    return promedio;
}