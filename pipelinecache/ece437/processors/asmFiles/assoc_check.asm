org		0x0000	
	ori		$1,$0,0xF0
    ori     $2,$0,0x1F0
    ori     $3,$0,0xFF0
	ori		$5,$0,0x30
    ori     $6,$0,0x50
    ori     $7,$0,0x80
    ori     $8,$0,0xAA0
    ori     $4,$0,0xFFF0

    sw $5,8($1)
    sw $6,8($2)
    sw $7,8($3)
    sw $8,8($4)

halt

