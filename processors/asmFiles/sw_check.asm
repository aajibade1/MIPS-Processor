org 0x0000
ori $29, $0, 0xFFFC
ori $2, $0, 5

lw $3, 0($2)
lw $4, 4($2)
lw $5, 8($2)
sw $3, 0($2)
halt
