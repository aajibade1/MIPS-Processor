count_days:
    org 0x0000
    //initialize $29 to 0xFFFC
    addi $29, $0, 0xFFFC
    addi $28, $0, 0xFFFC

    addi $10, $0, 2 //day
    addi $11, $0, 9 //month
    addi $12, $0, 2020 //year   

    addi $13, $0, 365
    addi $14, $0, 30
    addi $15, $0, 2000
    addi $16, $0, 0x1

    sub $12, $12, $15 //number of years
    sub $11, $11, $16 //number of months

    //push $12
    sub $29, $29, $15
    sw $12, 0($29)

    //push $13
    sub $29, $29, $15
    sw $13, 0($29)

    jal mul_alg
    //pop $17
    lw $17, 0($29)
    add $29, $29, $15
    
    //push $11
    sub $29, $29, $15
    sw $11, 0($29)
    
    //push $14
    sub $29, $29, $15
    sw $14, 0($29)

    jal mul_alg
    //pop $18
    lw $18, 0($29)
    add $29, $29, $15

    add $10, $17, $10
    add $10, $10, $18 //final result

    halt   
    

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

    jr $31
