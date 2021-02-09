#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <time.h>

int PGCD(int A, int B)
{
	if (A == 0)
		return B;
	else if (B == 0)
		return A;
	while (A != B){
		if (A > B)
			A = A - B;
		else
			B = B - A;
	}
	return A;
}

int RandX(int min, int max)
{
	return rand()%(max-min) + min;
}

int main (int argc, char * argv []){
	unsigned short a,b;
	//srand(time(0));

	printf("(II) Starting PGCD program\n");
	for (int i=0; i<2000; ++i){
		a=RandX(0, 65535);
		b=RandX(0, 65535);
		printf("%d :: Results for a= %d and b= %d : \t \n", i, a, b);
		printf("%d\n\n", PGCD(a, b));
	}
	
	printf("(II) End of PGCD program\n");
  return 0;
}
