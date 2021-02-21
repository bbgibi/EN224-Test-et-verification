#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>

int PGCD(int A, int B)
{
	assert(B >= 0 && B <= 65535);
	assert(A >= 0 && A <= 65535);

	int result = A;
	if (A == 0)
		return B;
	else if (B == 0)
		return A;
	while (result != B){
		if (result > B)
			result = result - B;
		else
			B = B - result;
	}

	assert(result >= 0 && result <= 65535);
	assert(result <= A && result <= B);
	assert((A % result == 0) && (B % result == 0));

	return result;
}

int main (int argc, char * argv []){
	int a,b;

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

	a = -1;			// Test pre-assert
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
