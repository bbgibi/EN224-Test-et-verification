#include "stdio.h"
#include "stdlib.h"
#include "math.h"

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

int main (int argc, char * argv []){
	unsigned short a,b;

	printf("(II) Starting PGCD program\n");
	a = 1;
	b = 1;
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));

	a = 65535;
	b = 1;
	PGCD(a, b);
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));

	a = 65535;
	b = 65535;
	PGCD(a, b);
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));

	a = 1;
	b = 65535;
	PGCD(a, b);
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));

	a = 100;
	b = 10;
	PGCD(a, b);
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));

	a = 10;
	b = 100;
	PGCD(a, b);
	printf("Results for a= %d and b= %d : \t %d\n", a, b, PGCD(a, b));
	
	printf("(II) End of PGCD program\n");
  return 0;
}
