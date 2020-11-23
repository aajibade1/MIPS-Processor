mul_alg:
    org 0x0000
    //initialize $29 to 0xFFFC
    addi $29, $0, 0xFFFC
    addi $10, $0, 6
    addi $11, $0, 20
    addi $15, $0, 4 //stack decrementer
    
    //push $10
    sub $29, $29, $15
    sw $10, 0($29)
    //push $11
    sub $29, $29, $15
    sw $11, 0($29)
    //pop $3 //first number
    lw $3, 0($29)
    add $29, $29, $15
    //pop $4 //second number
    lw $4, 0($29)
    add $29, $29, $15

    add $5, $3, $0 //copy first number 

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
    //push $2 //final result
    sub $29, $29, $15
    sw $2, 0($29)
    halt

    
