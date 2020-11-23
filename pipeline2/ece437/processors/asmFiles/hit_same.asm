org		0x0000	
	ori		$1,$0,0xF0
	ori		$2,$0,0x80
    ori		$3,$1,0xFF

loop:
    lw $5,8($1)
    addi $2, $1, 1
    beq $2, $3, end
    j loop

end:
    halt
