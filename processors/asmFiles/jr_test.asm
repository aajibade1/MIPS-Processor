org 0x0000
ori $2, $0, 7

jal bad
halt

bad:
    jr $31
