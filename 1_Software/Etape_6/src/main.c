#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>

#include "pgcd.h"

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");
	assert(PGCD(0,0) == 0);
	assert(PGCD(0,65535) == 0);
	assert(PGCD(65335,0) == 0);
	assert(PGCD(65535,65535) == 65535);
	assert(PGCD(10,100) == 10);
	
	printf("(II) End of PGCD program\n");
  return 0;
}
