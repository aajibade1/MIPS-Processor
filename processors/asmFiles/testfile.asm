org 0x0000
ori $2, $0, 0xF0

lw $3, 0($2)
lw $4, 4($2)
lw $5, 8($2)
sw $3, 12($2)
halt
org 0xF0
cfw 0x3
cfw 0x4
cfw 0x5
