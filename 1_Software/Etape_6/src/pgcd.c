#include "pgcd.h"

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

	assert(result > 0 && result <= 65535);
	assert(result <= A && result <= B);
	assert((A % result == 0) && (B % result == 0));

	return result;
}

int PGCD_2(int A, int B)
{
    assert(B >= 0 && B <= 65535);
	assert(A >= 0 && A <= 65535);

    int n1 = A, n2 = B, n_temp;
    while (n2 != 0){
        n_temp = n1 % n2;
        n1 = n2;
        n2 = n_temp;
    }

    assert(n1 > 0 && n1 <= 65535);
	assert(n1 <= A && n1 <= B);
	assert((A % n1 == 0) && (B % n1 == 0));

    return n1;
}