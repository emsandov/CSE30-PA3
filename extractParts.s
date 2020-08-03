/*
 * Filename: extractParts.s
 * Author: Emi Sandoval
 * UserId: cs30s120br
 * Date: 07/28/2020
 * Sources of help: Autograder tutors
 */

	@ hardware
		.arch	armv6
		.cpu	cortex-a53
		.syntax	unified
	@ externs
		.global	extractParts
	@ define constants
		.equ FP_OFFSET, 16		@ fp offset in stack frame
		.equ SIGN_SHIFT, 31		@ sign bit shift
		.equ EXP_SHIFT, 23		@ exp shift
		.equ EXP_MASK, 0x7F800000	@ hex mask value for exponent
		.equ MANT_MASK, 0x7FFFFF	@ hex mask value for mantissa 
		.equ MANT_SHIFT, 9		@ mantissa shift to left 
		.equ HIDDEN_BIT, 0x800000	@ hex mask value for hidden bit
	@ text
		.text
		.align 2
		
	extractParts:
		push	{r4, r5, r6, fp, lr}	@ push registers to stack
		add	fp, sp, FP_OFFSET	@ add offsets
		
		mov 	r2, r0			@ moving unsinged long to r2
		lsr	r0, r0, SIGN_SHIFT	@ shift sign bit to the right
		strb	r0, [r1, 0]		@ store sign bit into struct
		ldr	r5, =EXP_MASK		@ load masking value into r5
		and	r3, r2, r5		@ mask r2 using r5, store in r3
		lsr	r3, r3, EXP_SHIFT	@ shift exp bit to the right
		sub	r3, r3, 127		@ subtract exp using exp bias
		strb	r3, [r1, 1]		@ store the exp value to struct
		ldr	r6, =MANT_MASK		@ load masking value into r6
		and	r4, r2, r6		@ mask r2 using r6, store in r4
		orr	r4, r4, HIDDEN_BIT	@ or the hidden bit to reveal
		str	r4, [r1, 4]		@ store  mantissa to struct
		
		sub	sp, fp, FP_OFFSET	@ subtract offsets
		pop	{r4, r5, r6, fp, lr}	@ pop registers off
		bx	lr			@ branch to link register
	.end
