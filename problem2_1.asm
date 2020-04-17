# Cody Kelly
# CSCI-4591


# Problem 2.1
# For the following C statement, write the corresponding RISC-V
# assembly code. Assume that the C variables f, g, and h, have already been placed
# in registers x5, x6, and x7 respectively. Use a minimal number of RISC-V assembly
# instructions.
# f = g + (h ? 5);

addi x7 x7 -5	# h - 5
add x5 x6 x7	# f = g + (h - 5)
