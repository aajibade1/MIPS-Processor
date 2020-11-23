
  org 0x0000
  ori   $1,$zero,0xD269
  ori   $2,$zero,0x37F1
  ori   $3,$zero,0x37F1

  ori   $21,$zero,0xBEEF
  ori   $22,$zero,0xdead

# Now running all R type instructions
  beq   $2,$3, equal
  or    $10,$zero,$22
ret1:
  or    $11,$zero,$21
  bne   $1,$2, nequal
  or    $12,$zero,$22
ret2:
  or    $13,$zero,$21
  jal   noret
  or    $15,$zero,$21
  halt
equal:
  or    $10,$zero,$21
  j     ret1
  or    $11,$zero,$22
  halt
nequal:
  or    $12,$zero,$21
  j     ret2
  or    $13,$zero,$22
  halt
noret:
  or    $14,$zero,$21
  jr    $31
  or    $14,$zero,$21
  halt
  
