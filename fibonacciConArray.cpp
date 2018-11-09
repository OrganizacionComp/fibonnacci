#include <stdio.h>
#include <stdlib.h>

int fibonacci(int *, int);

int fibonacci(int *arr, int fin){
	int suma = 0;
	arr[0] = 0;
	arr[1] = 1;
	if(fin < 0 ){
		return -1;
	}
	if(fin== 0 || fin ==1 ){
		return arr[fin];
	}
	else{
		for(int i = 2; i < fin; i++){
			suma = arr[i-1]+arr[i-2];
			arr[i]= suma;
			suma = 0;			
		}
	}
	return arr[fin-1];
}

int main(){
	printf("--->Serie de Fibonacci<---\n");
	int fin;
	printf("Ingrese numero: ");
	scanf("%d",&fin);
	fin = fin + 1;
	int *arr = (int *)malloc(sizeof(int));
	int n = fibonacci(arr,fin);
	for(int i = 0; i < fin ;i++){
		printf("%4d ------> %4d \n",i,arr[i]);		
	}
	return 1;
}
