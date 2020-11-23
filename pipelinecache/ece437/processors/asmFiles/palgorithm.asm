#----------------------------------------------------------
# First Processor
#----------------------------------------------------------
  org   0x0000              # first processor p0
  ori   $sp, $zero, 0x3ffc  # stack
  jal   mainp0              # go to program
  halt

mainp0:
  push  $ra                 # save return address 
  ori   $t9, $zero, 10       # set seed to 5
  ori   $t6, $zero, 256     # set max rands to 256
  ori   $t7, $zero, 0  
createRandNum:

  or   $a0, $zero, $t9    
  jal   crc32               
  or   $t8, $zero, $v0    

  # push result
  ori   $a0, $zero, cl1      # move lock to arguement register
  jal   lock                # aquire the lock
  or    $a0, $zero, $t8     
  jal   pushToStack            
  ori   $a0, $zero, cl1      # move lock to arguement register
  jal   unlock              # release lock

  or   $t9, $zero, $t8    
  addi  $t7, $t7, 1
  bne   $t7, $t6, createRandNum           

  pop   $ra                 # get return address
  jr    $ra                 # return to caller

cl1:
  cfw 0x0

#----------------------------------------------------------
# Second Processor
#----------------------------------------------------------
  org   0x1000               # second processor p1
  ori   $sp, $zero, 0x7ffc  # stack
  jal   mainp1              # go to program
  halt

mainp1:
  push  $ra                 # save return address
  ori   $t5, $zero, 256
  ori   $t6, $zero, 0 

  #initialize results
  ori   $s0, $zero, 0   
  ori   $s1, $zero, 0x0000FFFF  
  ori   $s2, $zero, 0x00000000          

detVals:
  #verify there are values in the stack
  jal   stackwait

  # obtain locks and pop values
  ori   $a0, $zero, cl1      # move lock to arguement register
  jal   lock                # aquire the lock
  jal   popFromStack          
  or    $t7, $zero, $v0     
  ori   $a0, $zero, cl1      # move lock to arguement register
  jal   unlock              # release lock

  andi   $a0, $s1, 0x0000FFFF
  andi   $a1, $t7, 0x0000FFFF
  jal  min
  or   $s1, $zero, $v0
  
  andi   $a0, $s2, 0x0000FFFF
  jal  max
  or   $s2, $zero, $v0

  andi $t7, $t7, 0x0000FFFF
  add $s0, $s0, $t7

  addi  $t6, $t6, 1
  bne   $t6, $t5, detVals
  or $a0, $zero, $s0
  or $a1, $zero, $t5
  jal divide
  or $s0, $zero, $v0
  or $s3, $zero, $v1 
  ori $t0, $zero, mini
  sw $s1, 0($t0)
  ori $t0, $zero, maxi
  sw $s2, 0($t0)
  ori $t0, $zero, average
  sw $s0, 0($t0)

  pop   $ra                 # get return address
  jr    $ra                 # return to caller

res:
  cfw 0x0                   

# pass in an address to lock function in argument register 0
# returns when lock is available
lock:
aquire:
  ll    $t0, 0($a0)         # load lock location
  bne   $t0, $0, aquire     # wait on lock to be open
  addiu $t0, $t0, 1
  sc    $t0, 0($a0)
  beq   $t0, $0, lock       # if sc failed retry
  jr    $ra


# pass in an address to unlock function in argument register 0
# returns when lock is free
unlock:
  sw    $0, 0($a0)
  jr    $ra
                          
pushToStack:
  ori $t0, $zero, spointer
  lw $t1, 0($t0)                      
  ori $t2, $zero, sbase
  lw $t3, 0($t2)                      
  sub $t3, $t3, $t1                  
  sw   $a0, 0($t3)                    
  addi $t1, $t1, 4                    
  sw   $t1, 0($t0)                    
  jr   $ra  

stackwait:
  ori $t0, $zero, spointer
  lw $t1, 0($t0)                    
  beq $t1, $zero, stackwait
  jr   $ra  

popFromStack:
  ori $t0, $zero, spointer
  lw $t1, 0($t0)                     
  ori $t2, $zero, sbase
  lw $t3, 0($t2)                      
  addi $t1, $t1, -4                  
  sub $t3, $t3, $t1                   
  lw $v0, 0($t3)                      
  sw $zero, 0($t3)                   
  sw $t1, 0($t0)                      
  jr    $ra                 # return to caller

crc32:
  lui $t1, 0x04C1
  ori $t1, $t1, 0x1DB7
  or $t2, $0, $0
  ori $t3, $0, 32

l1:
  slt $t4, $t2, $t3
  beq $t4, $zero, l2

  ori $t5, $0, 31
  srlv $t4, $t5, $a0
  ori $t5, $0, 1
  sllv $a0, $t5, $a0
  beq $t4, $0, l3
  xor $a0, $a0, $t1
l3:
  addiu $t2, $t2, 1
  j l1
l2:
  or $v0, $a0, $0
  jr $ra


# registers a0-1,v0,t0
# a0 = a
# a1 = b
# v0 = result

#-max (a0=a,a1=b) returns v0=max(a,b)--------------
max:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a0, $a1
  beq   $t0, $0, maxrtn
  or    $v0, $0, $a1
maxrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

#-min (a0=a,a1=b) returns v0=min(a,b)--------------
min:
  push  $ra
  push  $a0
  push  $a1
  or    $v0, $0, $a0
  slt   $t0, $a1, $a0
  beq   $t0, $0, minrtn
  or    $v0, $0, $a1
minrtn:
  pop   $a1
  pop   $a0
  pop   $ra
  jr    $ra
#--------------------------------------------------

divide:               # setup frame
  push  $ra           # saved return address
  push  $a0           # saved register
  push  $a1           # saved register
  or    $v0, $0, $0   # Quotient v0=0
  or    $v1, $0, $a0  # Remainder t2=N=a0
  beq   $0, $a1, divrtn # test zero D
  slt   $t0, $a1, $0  # test neg D
  bne   $t0, $0, divdneg
  slt   $t0, $a0, $0  # test neg N
  bne   $t0, $0, divnneg
divloop:
  slt   $t0, $v1, $a1 # while R >= D
  bne   $t0, $0, divrtn
  addiu $v0, $v0, 1   # Q = Q + 1
  subu  $v1, $v1, $a1 # R = R - D
  j     divloop
divnneg:
  subu  $a0, $0, $a0  # negate N
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
  beq   $v1, $0, divrtn
  addiu $v0, $v0, -1  # return -Q-1
  j     divrtn
divdneg:
  subu  $a0, $0, $a1  # negate D
  jal   divide        # call divide
  subu  $v0, $0, $v0  # negate Q
divrtn:
  pop $a1
  pop $a0
  pop $ra
  jr  $ra
#-divide--------------------------------------------

spointer:
  cfw 0x0000
sbase:
  cfw 0xA000

org 0xE000
maxi:
  cfw 0xBAD0BAD0
mini:
  cfw 0xBADBBADB
average:
  cfw 0xBADEBADE
