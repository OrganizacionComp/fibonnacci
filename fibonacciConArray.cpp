#include <stdio.h>

int fibonacci(long *, int);

//La funcion retorna un 1 si tiene exito y un -1 si no
int fibonacci(long *arr, int fin){
	int suma = 0;
	arr[0] = 1;
	arr[1] = 1;
	if(fin <=1 ){
		return -1;
	}
	else{
		for(int i = 2; i < fin; i++){
			arr[i] =arr[i-1]+arr[i-2];
		}
	}
	return 1;
}
//El numero de oro representado como phi es 1,61803398874988.......
float numOro(long *,int);
float numOro(long *arr,int tam){
	return arr[tam-1]/(float)arr[tam-2];
}

int main(){
	printf("--->Serie de Fibonacci<---\n");
	int fin;
	printf("Ingrese numero: ");
	scanf("%d",&fin);
	long arr[fin];
	int n = fibonacci(arr,fin);
	int i=0;
	//**CON LONG SOLO SE PUEDE CALCULAR HASTA EL NUMERO EN LA POSICION 92 DE LA SERIE DE 
	//**FIBONACCI
	if(n>0){
		while(i<fin){
			printf("%d ------> %ld \n",i+1,arr[i]);	
			i++;	
		}
		//numero de oro mas proximo de la serie de fibonacci
		printf("El numero de oro mas proximo de la serie es: %f \n",numOro(arr,i));
	}
	return 1;
}
