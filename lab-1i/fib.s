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
	@r0 = number
	@r4=F(n)
	@r5=F(n+1)
	@r6=F(2n)
	@r7=F(2n+1)
	@r8= counter
	push {r4, r5, r6, r7, r8, lr}

	cmp r0, #0          @ if(R0 == 0) goto .L3 (which returns 0)
	ble .L3
	
	cmp r0, #1	 	 @ Compare R0 wtih 1
	beq .L4  		 @ If R0 == 1 goto .L4 (which returns 1)

	mov r8, #1
	mov r4, #1
	mov r5, #1

.Loop:
	cmp r8, r0	@while(i < n)
	bge .Exit	

	lsl r1, r8, #1	@if((i << 1) <= n)
	cmp r1, r0
	bgt .Else

	lsl r1, r5, #1	@t3 = t1 * (2 * t2 - t1);
	sub r1, r1, r4
	mul r6, r4, r1

	mul r1, r5, r5	@t4 = t2 * t2 + t1 * t1;
	mul r2, r4, r4
	add r7, r1, r2

	mov r4, r6	@t1 = t3;
	mov r5, r7	@t2 = t4;
	lsl r8,r8,#1	@i = i << 1;
	b .Loop

.Else:
	mov r4, r6	@t1 = t3;
	mov r6, r7	@t3 = t4;
	add r7, r4, r6	@t4 = t1 + t3;
	add r8, r8, #1	@i++;
	b .Loop

.L3:
	mov r0, #0			@ R0 = 0
	pop {r4, r5, r6, r7, r8, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r4, r5, r6, r7, r8, pc}		@ EPILOG

.Exit:
	mov r0, r6	@return t3;
	pop {r4, r5, r6, r7, r8, pc}		@EPILOG
	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
