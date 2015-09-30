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
	push {r3, r4, r5, lr}
	
mov r3, #-1	@ previous = -1;
mov r4, r0	@ i = x(r0);
mov r5, #0	@ sum = 0;
mov r0, #1	@ result  = 1;
	
.Loop:
cmp r4, #-1 	@ if (i <= -1);
ble .Exit	@ Exit
sub r4, r4, #1	@ i = i - 1;
add r5, r0, r3	@ sum = result + previous;
mov r3, r0	@ previous = result;
mov r0, r5	@ result = sum;
b .Loop	@ Loop

.Exit:
	pop {r3, r4, r5, pc}		@EPILOG
	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
