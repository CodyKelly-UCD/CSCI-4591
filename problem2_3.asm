# Cody Kelly
# CSCI-4591


# Problem 2.3
# For the following C statement, write the corresponding
# RISC-V assembly code. Assume that the variables f, g, h, i, and j are assigned to
# registers x5, x6, x7, x28, and x29, respectively. Assume that the base address
# of the arrays A and B are in registers x10 and x11, respectively.
# B[8] = A[i?j];


# --Note--: RARS doesn't support 8-byte words, so I'm using 4-byte words instead.

.data
A: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
B: .word 10, 11, 12, 13, 14, 15, 16, 17, 18, 19
i: .word 9      # Index of A
j: .word 3		# Index of B
wordSize: .word 4	# Word size in bytes

.text
# Load addresses of arrays
la x10, A
la x11, B

# Store i and j in registers x28 and x29, respectively
lw x28 i
lw x29 j

# Store i - j in x30
neg x30 x29
add x30 x30 x28

# Convert index i - j to a byte offset
lw x5 wordSize
mul x30 x30 x5

add x5 x10 x30	# Store address of A[i - j]
lw x5 0(x5)	# x5 now holds A[i - j]
sw x5 32(x11)	# 32(x11) is B[8] since word size is 4 bytes. So B[8] now equals A[i - j].