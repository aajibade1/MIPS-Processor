org 0x0000  

ori $29, $0, 0xFFFC
ori $10, $0, 0x2 #day register
ori $11, $0, 0x9  #month register
ori $12, $0, 0x7E4  #year register
ori $13, $0, 0x0   #total days
ori $14, $0, 0xFFF8   
ori $15, $0, 0x1E #30 day constant
ori $16, $0, 0x16D #365 constant
ori $17, $0, 0x7D0 #2000 constant
    
days_count:    
    addu $13, $10, $0 # add days to sum
    ori $5, $0, 1 #one value
    subu $11, $11, $5 #sub month by month
    push $15
    push $11
    jal multiply
    pop $18 # pop first multiplcation to stack
    addu $13,$13,$18 #add to total days
    subu $17, $12, $17 #subtract current year from 2000
    push $17
    push $16
    jal multiply
    pop $18
    addu $13, $13, $18
    halt
    
    multiply:
        pop $3
        pop $2
        
        ori $4, $0, 0    #final value register
        ori $6, $0, 1    #value to decrement by  

    loop: 
        beq $2,$0, end #branch when done
        addu $4, $4, $3 #add value to final
        subu $2, $2, $6 #decrement what to multiply by
        j loop

    end:
        push $4
        jr $31
