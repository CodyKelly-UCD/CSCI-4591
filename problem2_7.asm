# Cody Kelly
# CSCI-4591


# Problem 2.7
# Translate the following C code to RISC-V. Assume that the
# variables f, g, h, i, and j are assigned to registers x5, x6, x7, x28, and x29,
# respectively. Assume that the base address of the arrays A and B are in registers x10
# and x11, respectively. Assume that the elements of the arrays A and B are 8-byte
# words:
# B[8] = A[i] + A[j];


# --Note--: RARS doesn't support 8-byte words, so I'm using 4-byte words instead.

.data
A: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
B: .word 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
i: .word 2      	# Index of A
j: .word 8		# Index of B
wordSize: .word 4	# Word size in bytes

.text
# Load addresses of arrays
la x10, A
la x11, B

# Store i and j in registers x28 and x29, respectively
lw x28 i
lw x29 j

# Convert indexes to byte offsets
lw x5 wordSize
mul x28 x28 x5
mul x29 x29 x5

# Adding A[i] and A[j]
add x5 x10 x28	# Store address of A[i]
lw x5 0(x5)	# x5 now holds A[i]
add x6 x10 x29	# Store address of A[j]
lw x6 0(x6)	# x6 now holds A[j]
add x7 x5 x6	# Store A[i] + A[j] into x7
sw x7 32(x11)	# 32(x11) is B[8] since word size is 4 bytes. So B[8] now equals A[i] + A[j].
