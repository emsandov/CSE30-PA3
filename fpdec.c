/*
 * Filename: fpdec.c
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 07/24/2020
 * Sources of help: Autograder tutors
 */
#include "pa3.h"
#include "pa3Strings.h"
#include <stdlib.h>
#include <stdio.h>

/*
 * Function Name: main()
 * Function Prototype: int main( int argc, char * argv[] )
 * Description: This is the main function for my program. It parses the 
 * command line arguments, builds the struct of IEEE-754 floating point parts,
 * and prints out the struct's members.
 * Parameters: int argc is used to check if a valid number of arguments was
 * passed in and char * argv[] is used as an array of char pointers to keep
 * store the input.
 * Side Effects: None
 * Error Conditions: None
 * Return Value: This function returns an int, it will be used to determine
 * if the execution of the function was succesful or not.
 */
int main( int argc, char * argv[] ) {
	//check for invalid number of args passed in
	if (argc != 2) {
		//print invalid args to stderr
		fprintf(stderr, INVALID_ARGS);
		//print short usage to stderr
		fprintf(stderr, SHORT_USAGE);
		//return, failed
		return EXIT_FAILURE;
	}
	//number of arguments is valid
	else {
		//parse command line arguments
		unsigned long pnreturn = parseNum(argv);
		//instantiate ieeeParts_t struct
		ieeeParts_t temp;
		//populate struct using extractParts()
		extractParts(pnreturn, &temp);
		//sign bit is printed to stdout
		printf(SIGN_STR, temp.sign);
		//exponent bit is printed to stdout
		printf(EXP_STR, temp.exp);
		//mantissa bit is printed to stdout
		printf(MANTISSA_STR, temp.mantissa);
		//return, success
		return EXIT_SUCCESS;
	}
}
	       	
