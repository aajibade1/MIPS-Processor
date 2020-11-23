`include "alu_if.vh"
`include "cpu_types_pkg.vh"

module alu 
(
    alu_if.alu aluif
);
    //imports
    import cpu_types_pkg::*;

    always_comb
    begin
        aluif.portOut = '0;
        aluif.Over = 0;
        aluif.Neg = 0;
        aluif.Zero = 0;

        //alu operations
        casez(aluif.ALUOP)
        ALU_SLL:
        begin
            aluif.portOut = aluif.portB << aluif.portA[4:0];
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_SRL:
        begin
            aluif.portOut = aluif.portB >> aluif.portA[4:0];
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_ADD:
        begin
            aluif.portOut = $signed(aluif.portA) + $signed(aluif.portB);
            
            //alu overflow flag
            if (aluif.portA[31] == aluif.portB[31])
            begin
               if (aluif.portA[31] ^ aluif.portOut[31] == 1'b1)
               begin
                   aluif.Over = 1;
               end 
            end
            //alu negative flag
            if (aluif.portOut[31] == 1'b1)
            begin
                aluif.Neg = 1'b1;
            end
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_SUB:
        begin
            aluif.portOut = $signed(aluif.portA) - $signed(aluif.portB);
            
            //alu overflow flag
            if (aluif.portA[31] != aluif.portB[31])
            begin
               if (aluif.portB[31] ^ aluif.portOut[31] == 1'b0)
               begin
                   aluif.Over = 1;
               end 
            end
            //alu negative flag
            if (aluif.portOut[31] == 1'b1)
            begin
                aluif.Neg = 1'b1;
            end
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_AND:
        begin
            aluif.portOut = aluif.portA & aluif.portB;
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_OR:
        begin
            aluif.portOut = aluif.portA | aluif.portB;
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_XOR:
        begin
            aluif.portOut = aluif.portA ^ aluif.portB;
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_NOR:
        begin
            aluif.portOut = ~(aluif.portA | aluif.portB);
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_SLT:
        begin
            aluif.portOut = ($signed(aluif.portA) < $signed(aluif.portB)) ? 32'b1 : 32'b0;
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        ALU_SLTU:
        begin
            aluif.portOut = (aluif.portA < aluif.portB) ? 32'b1 : 32'b0;
            //alu Zero flag
            if (aluif.portOut == 32'b0)
            begin
                aluif.Zero = 1'b1;    
            end
        end
        endcase   
    end
    

endmodule

