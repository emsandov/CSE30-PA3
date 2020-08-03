/*
 * Filename: fpdecEC.s
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 08/01/2020
 * Sources of Help: John Li on Piazza
 */

	@ hardware
		.arch	armv6
		.cpu	cortex-a56
		.syntax	unified
	@ externs
		.global fpdecEC
	@ define constants
		.equ	FP_OFFSET, 20		@ fp offset in stack frame
		.equ	EXIT_FAILURE, 1		@ failed return from main
		.equ	EXIT_SUCCESS, 0		@ success return from main
		.equ	ALLOCATE, 22		@ to allocate space for struct
		.equ	SIGN_BIT, -22		@ sign bit in memory
		.equ	EXP_BIT, -21		@ exponent bit in memory
		.equ	MANT_BIT, -20		@ mantissa bit in memory
		.equ	VALID_ARG, 2		@ valid number of args
		.equ	STRUCT, 8		@ instantiating struct	
	@ text
		.text
		.align 2
	@ data
			.data
	SHORT_USAGE:	.asciz	"\n"\ "Usage./fpdec {hexString}"\ "\n\n""

			.data
	INVALID_ARGS:	.asciz	"Incorrect number of arguments.\n"

			.data
	SIGN_STR:	.asciz	"Sign Bit: %u\n"
	
			.data
	EXP_STR:	.asciz	"Unbiased Exponent: %hhd\n"

			.data
	MANTISSA_STR:	.asciz	"Mantissa: %lx\n" 
	 
	fpdecEC:
		push	{r4, r5, r6, fp, lr}	@ push registers to stack
		add	fp, sp, FP_OFFSET	@ add offsets 

		mov	r5, r0			@ moving argc to register 5
		move	r6, r1			@ moving argv to register 6
		ldr	r0, =stderr		@ loading stderr output to r0 
		cmp	r5, VALID_ARG		@ comparing argc to 2
		beq	next			@ skip to next
		ldr	r0, [r0]		@ load stderr to r0
		ldr	r1, =SHORT_USAGE	@ load short usage to r1
		bl	fprintf			@ print short usage message
		ldr	r0, =stderr		@ load stderr to r0
		ldr	r0, [r0]		@ load stderr to r0
		ldr	r1, =INVALID_ARGS 	@ load invalid arg string to r1
		bl	fprintf			@ print invalid args string
		mov	r0, EXIT_FAILURE	@ has failed, return
		b	done			@ go to done section
		
	next: 	
		mov 	r0, r6			@ move argv to output register
		bl	parseNum		@ call parseNum on argv, r1
		sub	sp, sp, STRUCT 		@ instantiating struct
		sub	r0, fp, ALLOCATE	@ allocating space on struct	
		bl	extractParts		@ call to extractParts
		ldrb	r1, [fp, SIGN_BIT]	@ load sign into memory
		ldr	r0, =SIGN_STR		@ load string for sign into r0
		bl	printf			@ print sign bit from struct		
		ldrb	r1, [fp, EXP_BIT]	@ load exponent into memory
		ldr	r0, =EXP_STR		@ load string for exp into r0
		bl	printf			@ print exp bit from struct
		ldrb	r1, [fp, MANT_BIT]	@ load mantissa into memory
		ldr	r0, =MANTISSA_STR	@ load string for mant into r0
		bl	printf			@ print mant bit from struct
		mov	r0, EXIT_SUCCESS	@ return succesfully

	done:
		sub	sp, fp, FP_OFFSET	@ subtract offsets
		pop	{r4, r5, r6, fp, lr}	@ pop registers off
		bx	lr			@ branch to link register
	.end					@ end of file directive		
