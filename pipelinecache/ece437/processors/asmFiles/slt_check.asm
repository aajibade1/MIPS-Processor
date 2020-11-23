	ori		$1,$0,0xF0
    ori     $2,$0,0x1F0
    ori     $3,$0,0xFF0
	ori		$5,$0,0x30
    ori     $6,$0,0x50
    ori     $7,$0,0x80
    ori     $8,$0,0xAA0
    ori     $4,$0,0xFFF0


    slt $7, $5, $6
    halt
