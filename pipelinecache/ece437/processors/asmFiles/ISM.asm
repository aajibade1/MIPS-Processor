# Invalid to Shared to Modified

# core 1
org 0x0000
  ori $t0, $0, data1
  ori $t1, $t1, 0xF0
  ori $t2,$0,0x80
  lw $t2, 0($t1)
  addi	$t2, $t1, 1

sw  $t1, 0($t0)
halt

# core 2
org 0x0200
  halt
org 0x0400
data1:
  cfw 0xBADBBADB
data2:
  cfw 0xBAD0BAD0
data3:
  cfw 0xBAD0BAD0
data4:
  cfw 0xBAD0BAD0
