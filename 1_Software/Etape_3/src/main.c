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

int PGCD_2(int A, int B)
{
    int n1 = A, n2 = B, n_temp;
    while (n2 != 0){
        n_temp = n1 % n2;
        n1 = n2;
        n2 = n_temp;
    }

    return n1;
}

int RandX(int min, int max)
{
	return rand()%(max-min) + min;
}

int main (int argc, char * argv []){
	unsigned short a,b;
	//srand(time(0));
	
	int pgcd_1, pgcd_2;
	printf("(II) Starting PGCD program\n");
	for (int i=0; i<65536; ++i){
		a = RandX(0, 65535);
		b = RandX(0, 65535);
		pgcd_1 = PGCD(a,b);
		pgcd_2 = PGCD_2(a,b);
		if(pgcd_1 != pgcd_2){
			printf("\nTEST FAILED for : i=%d a=%d b=%d 1st=%d 2nd=%d\n", i, a, b, pgcd_1, pgcd_2);
			exit(EXIT_FAILURE);
		}
	}
	printf("\nTest PASSED\n\n");
	printf("(II) End of PGCD program\n");
	
  return 0;
}
