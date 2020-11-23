org 0x0000
ori $29, $0, 0xFFFC
ori $2, $0, 5
ori $3, $0, 3

push $2
push $3

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
    halt
