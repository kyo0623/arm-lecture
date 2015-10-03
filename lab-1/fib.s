	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	@ r2 = V(n)
	@ r1 = V(n-1)
	@ r0 = counter
	push {lr}

	cmp r0, #0          @ if(R0 <= 0) goto .L3 (which returns 0)
	ble .L3

	cmp r0, #1	 	 @ Compare R0 wtih 1
	beq .L4  		 @ If R0 == 1 goto .L4

	sub r0, r0, #1		@ R0 = current - 1
	add r3, r1, r2		@ r3 = V(n-1) + V(n)
	mov r1, r2		@ r1 = V(n)
	mov r2, r3		@ r2 = r3

	bl  fibonacci		 @ 
	pop {pc}		@EPILOG
	@ END CODE MODIFICATION
.L3:
	mov r0, r1			@
	pop {pc}		@ EPILOG

.L4:
	mov r0, r2			@
	pop {pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
