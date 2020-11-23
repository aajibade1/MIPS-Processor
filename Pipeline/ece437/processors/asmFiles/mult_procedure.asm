mul_pro:
    org 0x0000
    //initialize $29 to 0xFFFC
    addi $29, $0, 0xFFFC
    addi $28, $0, 0xFFFC
    addi $15, $0, 4 //stack decrementer

    //push operands here
    addi $20, $0, 1
    //push $20
    sub $29, $29, $15
    sw $20, 0($29)

    addi $21, $0, 1
    //push $21
    sub $29, $29, $15
    sw $21, 0($29)

    addi $22, $0, 1
    //push $22
    sub $29, $29, $15
    sw $22, 0($29)

    addi $23, $0, 1
    //push $22
    sub $29, $29, $15
    sw $23, 0($29)

    //call multiply
loop2:
    j mul_alg
ret2:
    //pop $27 //final result
    lw $27, 0($29)
    add $29, $29, $15
    
    beq $29, $28, exit_pro
    //push $27
    sub $29, $29, $15
    sw $27, 0($29)

    j loop2

mul_alg:
    //pop $3 //first number
    lw $3, 0($29)
    add $29, $29, $15

    //pop $4 //second number
    lw $4, 0($29)
    add $29, $29, $15

    andi $5, $3, 0xFFFF //copy first number 

    and $2, $2, $0 //accumulator
    addi $7, $0, 0x001F //counter(31)
    addi $8, $0, 0x001F //right shifter(31) 
    addi $9, $0, 0x0001 //shift left by 1
loop:
    addu $6, $4, $0 //copy second number
    sllv $6, $7, $6 //shift left
    srlv $6, $8, $6 //shift right
    bne $6, $0, inc //add if 1    
ret1:
    beq $7, $0, exit //exit if counter is 0
    
    sllv $5, $9, $5 //shift first number left by 1
    subu $7, $7, $9 //decrement counter by 1
    j loop

inc:
    addu $2, $2, $5 
    j ret1

exit:
    //push $2
    sub $29, $29, $15
    sw $2, 0($29)

    j ret2

exit_pro:
    halt
