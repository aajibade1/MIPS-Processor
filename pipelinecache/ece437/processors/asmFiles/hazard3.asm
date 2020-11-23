org		0x0000	
	ori		$1,$0,0x1
	ori		$2,$0,0x2

    add     $3,$2,$1
    beq     $0, $0, two
    ori     $4, $0, 0xdead
    ori     $5, $0, 0xdead
    halt
    two:
    ori     $6, $0, 0xbeef
    halt
