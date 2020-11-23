//interface
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

module alu (
    alu_if.alu aluinf
);

import cpu_types_pkg::*;


always_comb begin
    aluinf.OUTPORT = '0;
    aluinf.OVF = '0;

    casez(aluinf.ALUOP) 
        ALU_AND: begin 
            aluinf.OUTPORT = aluinf.PORTA & aluinf.PORTB;
        end

        ALU_OR: begin 
            aluinf.OUTPORT = aluinf.PORTA | aluinf.PORTB;
        end

        ALU_XOR: begin 
            aluinf.OUTPORT = aluinf.PORTA ^ aluinf.PORTB;
        end

        ALU_NOR: begin 
            aluinf.OUTPORT = ~(aluinf.PORTA | aluinf.PORTB);
        end

        ALU_SLL: begin 
            aluinf.OUTPORT = aluinf.PORTB << aluinf.PORTA[4:0] ;
        end

        ALU_SRL: begin 
            aluinf.OUTPORT = aluinf.PORTB >> aluinf.PORTA[4:0];
        end

        ALU_SLT: begin 
            aluinf.OUTPORT = ($signed(aluinf.PORTA) < $signed(aluinf.PORTB)) ? 1:0;
        end

        ALU_SLTU: begin 
            aluinf.OUTPORT = (aluinf.PORTA < aluinf.PORTB) ? 1:0;
        end 

        ALU_ADD: begin 
            aluinf.OUTPORT = (aluinf.PORTA) + (aluinf.PORTB);
            aluinf.OVF = (~aluinf.PORTA[31] && ~aluinf.PORTB[31] && aluinf.OUTPORT[31]) || (aluinf.PORTA[31] && aluinf.PORTB[31] && ~aluinf.OUTPORT[31]);
        end   

        ALU_SUB: begin 
            aluinf.OUTPORT = (aluinf.PORTA) - (aluinf.PORTB);
            aluinf.OVF = (~aluinf.PORTA[31] && aluinf.PORTB[31] && aluinf.OUTPORT[31]) || (aluinf.PORTA[31] && ~aluinf.PORTB[31] && ~aluinf.OUTPORT[31]);
        end                
    
    endcase
end

assign aluinf.ZERO = aluinf.OUTPORT ? 0 : 1;
assign aluinf.NEG = aluinf.OUTPORT[31];

endmodule