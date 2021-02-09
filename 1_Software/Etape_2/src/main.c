#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <time.h>

#define RAND_MAX 65535

int PGCD(int A, int B)
{
	while (A != B){
		if (A > B)
			A = A - B;
		else
			B = B - A;
	}
	return A;
}

int RandA()
{
	unsigned short int A = rand();
	if (A == 0)
		A = 1;
	return A;
}

int RandB()
{
	unsigned short int B = rand();
	if (B == 0)
		B = 1;
	return B;
}

int main (int argc, char * argv []){
	unsigned short a,b;
	srand(time(0));

	printf("(II) Starting PGCD program\n");
	for (int i=0; i<2000; ++i){
		a=RandA();
		b=RandB();
		printf("%d :: Results for a= %d and b= %d : \t \n", i, a, b);
		printf("%d\n\n", PGCD(a, b));
	}
	
	printf("(II) End of PGCD program\n");
  return 0;
}
