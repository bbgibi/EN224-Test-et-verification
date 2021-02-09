#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>

#include "pgcd.h"

int main (int argc, char * argv []){
	FILE *fA, *fB, *fC;
	int a, b, c;

	fA = fopen ("./ref_A.txt", "r");
	fB = fopen ("./ref_B.txt", "r");
	fC = fopen ("./resu_C.txt", "w");
	if (fA  == NULL) {
    		perror("Failed A: ");
    		exit(EXIT_FAILURE);
	}
	if (fB  == NULL) {
    		perror("Failed B: ");
    		exit(EXIT_FAILURE);
	}
	if (fC  == NULL) {
    		perror("Failed C: ");
    		exit(EXIT_FAILURE);
	}
	
	printf("(II) Starting PGCD program\n");

	for (int i=0; i<65536; ++i){
		fscanf(fA, "%d", &a);
		fscanf(fB, "%d", &b);
		c = PGCD(a,b);
		fprintf(fC, "%d\n", c);
	}

	printf("(II) End of PGCD program\n");

	fclose(fA);
	fclose(fB);
	fclose(fC);
  return 0;
}
