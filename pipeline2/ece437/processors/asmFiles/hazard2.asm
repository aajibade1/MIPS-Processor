org		0x0000	
	ori		$1,$0,0xF0
	ori		$2,$0,0x80
	lw		$3,0($1)
	lw		$4,4($1)
	lw		$5,8($1)
    sw      $5,0($1)

    halt
