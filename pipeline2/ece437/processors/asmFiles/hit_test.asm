org		0x0000	
	ori		$1,$0,0xF0
    ori     $3,$0,0xFF0
	ori		$2,$0,0x80
    ori     $5,$0, 3

loop:   
    lw $5,8($1)
    sw $2,8($2)
    ori	$1,$0,0xFF0
    addi $5, $5, 1
    beq $5, $2, end
    j loop

end:
    halt