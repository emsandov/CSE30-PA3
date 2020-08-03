/*
 * Filename: testextractParts.c
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 07/31/2020
 * Sources of Help: Autograder tutors
 */

#include "test.h"	/* For TEST() macro and stdio.h */
#include <string.h>
#include <stdlib.h>
#include "pa3.h"
#include "pa3Strings.h"
/* Unit test for extractParts.s
 * 
 * void extractParts( unsigned long ieeeBin, ieeeParts_t * fill );
 *
 */

/*
 * Function Name: extractParts_positive_hex_value()
 * Function Prototype: void extractParts_min_hex_value()
 * Description: This tests a positive hex value as input to extractParts()
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: None
 */
void extractParts_positive_hex_value(){
	//declare a char pointer
	char * hex_string = "0x12345677";
	//declare an unsigned long to store output of strtoul
	unsigned long positive = strtoul(hex_string, NULL, 0);
	//declare an unsigned lon to store output of strtoul
	unsigned long mantex = strtoul("0xb45677", NULL, 0);
	//declare struct called fill
	ieeeParts_t fill;
 	//call extractParts() on positive and address in fill struct
	extractParts(positive, &fill);
	//call TEST() on sign section in struct
	TEST(fill.sign == 0);
	//call TEST() on exponent section in struct
	TEST(fill.exp == -91);
	//call TEST() on mantissa section in struct
	TEST(fill.mantissa == mantex);
	//print mantissa string to stdout
	printf(MANTISSA_STR, fill.mantissa);
}
/*
 * Function Name: main()
 * Function Prototype: int main()
 * Description: This is my main method for testextractParts()
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: This function returns an int, it will be used to determine
 * if the function was executed successfully or not
 */
int main() {
	//print string to stderr when testing unit tests
	fprintf( stderr, "Testing extractParts...\n\n" );
	//runs test for extractParts_positive_hex_value
	extractParts_positive_hex_value();
	//print string to stderr when done with testing
	fprintf( stderr, "\nDone running tests.\n" );
	//return from function
	return 0;
}
