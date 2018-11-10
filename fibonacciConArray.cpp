#include <stdio.h>
#include <stdlib.h>

long fibonacci(long *, int);

long fibonacci(long *arr, int fin){
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
			arr[i] =arr[i-1]+arr[i-2];
		}
	}
	return arr[fin-1];
}

int main(){
	printf("--->Serie de Fibonacci<---\n");
	int fin;
	printf("Ingrese numero: ");
	scanf("%d",&fin);
	fin = fin;
	long arr[fin];
	long n = fibonacci(arr,fin);
	for(int i = 0; i < fin ;i++){
		printf("%d ------> %ld \n",i+1,arr[i]);		
	}
	return 1;
}
