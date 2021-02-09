#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include "pgcd.h"

TEST_CASE( "Normal values for PGCD are computed", "[pgcd_n]" ) {
	SECTION ("A < B"){
		REQUIRE(PGCD(10, 100) == 10);
	}
	SECTION ("A > B"){
		REQUIRE(PGCD(100, 10) == 10);
	}
	SECTION ("A = B"){
		REQUIRE(PGCD(10, 10) == 10);
	}
}

TEST_CASE( "Specific values for PGCD are computed", "[pgcd_spe]" ) {
	SECTION ("A < B"){
		REQUIRE(PGCD(0, 65535) == 0);
	}
	SECTION ("A > B"){
		REQUIRE(PGCD(65535, 0) == 0);
	}
	SECTION ("A = B"){
		REQUIRE(PGCD(65535, 65535) == 65535);
		REQUIRE(PGCD(0, 0) == 0);
	}
}


