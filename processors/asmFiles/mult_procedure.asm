org 0x0000

ori $29, $0, 0xFFFC
ori $10, $0, 0x2
ori $11, $0, 0x3
ori $12, $0, 0x4 
ori $13, $0, 0x5
ori $15, $0, 0x6
ori $14, $0, 0xFFF8

push $10
push $11
push $12
push $13
push $15

main:
    beq $29, $14, calcEnd #branch when stack has one
    jal multiply
    j main 

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

calcEnd:
    halt
    
