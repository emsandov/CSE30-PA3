/*
 * Filename: testparseNum.c
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 07/31/2020
 * Sources of Help: Autograder tutors 
 */

#include "test.h"	/* For TEST() macro and stdio.h */
#include <string.h>
#include <stdlib.h>
#include "pa3.h"
/* Unit test for parseNum.s
 * 
 * unsigned long parseNum( char * argv[] );
 *
 */

/*
 * Function Name: parseNum_positive_value()
 * Function Prototype: void parseNum_positive_value()
 * Description: This tests a positive hexadecimal value input
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: None
 */
void parseNum_positive_value(){
	//create an array of char pointers
	char * argv[] = {"hex", "0x12345677"};
	//call TEST() to parseNum function
	TEST(parseNum(argv) ==  0x12345677);
}
/*
 * Function Name: parseNum_large_value()
 * Function Prototype: void parseNum_large_value()
 * Description: This tests a large hexadecimal value input
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: None
 */
void parseNum_large_value(){
	//create an array of char pointers
	char * argv[] = {"hex", "0xFFFFFFFF"};
	//call TEST() to test parseNum function
	TEST(parseNum(argv) == 0xFFFFFFFF);
}
/*
 * Function Name: parseNum_negative_value()
 * Function Prototype: void parseNum_negative_value()
 * Description: This tests a negative hexadecimal value input
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: None
 */
void parseNum_negative_value(){
	//create an array of char pointers
	char * argv[] = {"hex", "0xABCDEEFF"};
	//call TEST() to test parseNUm function
	TEST(parseNum(argv) == 0xABCDEEFF);
}

/*
 * Function Name: main()
 * Function Prototype: int main()
 * Description: This is my main method for testparseNum()
 * Parameters: None
 * Side Effects: None
 * Error Conditions: None
 * Return Value: This function returns an int, it will be used to determine
 * if the function was executed succesfully or not.
 */
int main() {
	//prints string to stderr when testing unit tests
	fprintf( stderr, "Testing parseNum...\n\n" );
	//runs test for parseNum_positive_value()
	parseNum_positive_value();
	//runs test for parseNum_large_value()
	parseNum_large_value();
	//runs test for parseNum_negative_value()
	parseNum_negative_value();
	//prints string to stderr when done with testing
	fprintf( stderr, "\nDone running tests. \n" );
	//return from function
	return 0;
}
