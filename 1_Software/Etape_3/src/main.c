#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <time.h>

//#define WRITE_RAND
#define READ_RAND

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
	srand(time(0));
	FILE *fp;

	#ifdef WRITE_RAND
		fp = fopen("./gcdOut.txt", "w");
		if (fp == NULL) {
    		perror("Failed: ");
    		exit(EXIT_FAILURE);
		}
		for (int i=0; i<65536; ++i){
			b=RandX(0, 65535);
			b=RandX(0, 65535);
			fprintf(fp, "%d\t%d\n", a, b);
		}
		fclose(fp);
	#endif
	#ifdef READ_RAND
		int pgcd_excel, pgcd_prog;

		fp = fopen("./gcdOut_excel.txt", "r");
		if (fp == NULL) {
    		perror("Failed: ");
    		exit(EXIT_FAILURE);
		}

		printf("(II) Starting PGCD program\n");
		for (int i=0; i<65536; ++i){
			fscanf(fp, "%hd\t%hd\t%d", &a, &b, &pgcd_excel);
			pgcd_prog = PGCD(a,b);
			if(pgcd_excel != pgcd_prog){
				printf("\nTEST FAILED for : i=%d a=%d b=%d excel=%d pgcd=%d\n", i, a, b, pgcd_excel, pgcd_prog);
				exit(EXIT_FAILURE);
			}
		}
		printf("\nTest PASSED\n\n");
		printf("(II) End of PGCD program\n");
	#endif
	
	
  return 0;
}
