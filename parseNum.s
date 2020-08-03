/*
 * Filename: parseNum.s
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 07/24/2020
 * Sources of help: Autograder tutor: John Li
 */

	@ hardware
		.arch	armv6
		.cpu	cortex-a53
		.syntax	unified
	@ externs
		.extern	strtoul
		.global	parseNum
	@ define constants
		.equ FP_OFFSET, 4		@ fp offset in stack frame
		.equ STRING_OFFSET, 4		@ offset for argv incr
		.equ BASE, 16 			@ int base for strtoul
	@ text
		.text
		.align	2
	parseNum:	
		push	{fp, lr}		@ push registers to stack
		add	fp, sp, FP_OFFSET	@ add offsets

		ldr	r0, [r0, STRING_OFFSET]	@ load string into r0
		mov	r1, 0			@ move null into r1
		mov	r2, BASE		@ move base value into r2
		bl	strtoul			@ call strtoul on input
		
		sub	sp, fp, FP_OFFSET	@ subtract offsets
		pop	{fp, lr}		@ pop registers off of stack
		bx	lr			@ branch to link register
	.end					@ end of file directive
