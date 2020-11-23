org		0x0000	
	ori		$1,$0,0xF0
    ori     $2,$0,0xFF0
    ori     $3,$0,0x1F0
	ori		$5,$0,0x80

    sw $5,8($1)
    sw $5,8($2)
    sw $5,8($3)

halt

