`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"


module control_unit (
    control_unit_if.cu cuif
);

import cpu_types_pkg::*;

always_comb begin
    cuif.RegDst = '0;
    cuif.ALUSrc = '0;
    cuif.MemtoReg = '0;
    cuif.RegWr = '0;
    cuif.dWEN = '0;
    cuif.dREN = '0;
    cuif.ExtOp = '0;
    cuif.JALen = '0;
    cuif.ALUOP = ALU_SLL;
    cuif.halt = '0;
    cuif.PCSrc = '0;
    cuif.beq = '0;
    cuif.iREN = '1;
    cuif.rs = '0;
    cuif.rt = '0;
    cuif.rd = '0;
    cuif.imm = '0;
    if(cuif.imemload[31:26] == RTYPE) begin
        cuif.RegDst = '0;
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.rd = cuif.imemload[15:11];
        cuif.PCSrc = '0;
        casez(cuif.imemload[5:0])
            SLLV: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SLL;
            end
            SRLV: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SRL;
            end
            ADD: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_ADD;
            end
            ADDU: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_ADD;
            end
            SUB: begin 
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SUB;
            end
            SUBU: begin 
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SUB;
            end
            AND: begin 
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_AND;
            end
            OR: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_OR;
            end    
            XOR: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_XOR;
            end
            NOR: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_NOR;
            end
            SLT: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SLT;
            end
            SLTU: begin
                cuif.RegWr = 1'b1;
                cuif.ALUOP = ALU_SLTU;
            end
            JR: begin
                cuif.PCSrc = 3'd3;
            end
            default: begin
                cuif.ALUOP = ALU_ADD;
            end
        endcase
    end
    else if (cuif.imemload[31:26] == J) begin
        cuif.PCSrc = 3'd2;       
    end
    else if (cuif.imemload[31:26] == JAL) begin
        cuif.JALen = 1'b1;
        cuif.PCSrc = 3'd2;
        cuif.RegWr = 1'b1;
        cuif.RegDst = 2'd2;
    end
    else if (cuif.imemload[31:26] == HALT) begin
        cuif.halt = 1'b1;
    end
    else begin
        cuif.rs = cuif.imemload[25:21];
        cuif.rt = cuif.imemload[20:16];
        cuif.imm = cuif.imemload[15:0];
        cuif.RegDst = 2'd1;
        cuif.PCSrc = 3'd0;
        casez (cuif.imemload[31:26])
            ORI: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.ExtOp = 2'd0;
                cuif.ALUOP = ALU_OR;
            end
            BEQ: begin   
                cuif.ALUSrc = 1'b0;
                cuif.RegWr = 1'b0;
                cuif.dWEN = 1'b0;
                cuif.beq = 1'b1;
                cuif.ALUOP = ALU_SUB;
                cuif.PCSrc = 3'd1;
            end
            BNE: begin
                cuif.ALUSrc = 1'b0;
                cuif.RegWr = 1'b0;
                cuif.dWEN = 1'b0;
                cuif.beq = 1'b0;
                cuif.ALUOP = ALU_SUB;   
                cuif.PCSrc = 3'd1;
            end
            LUI: begin 
                cuif.ALUSrc = 1'b1;
                cuif.ExtOp = 2'd2;
                cuif.RegWr = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.rs = '0;
                cuif.ALUOP = ALU_ADD;  
            end
            LW: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b1;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.RegDst = 2'd1;
                cuif.dREN = 1'b1;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_ADD;
            end        
            SLTI: begin 
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_SLT;        
            end
            SLTIU: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_SLTU;        
            end
            XORI: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd0;
                cuif.ALUOP = ALU_XOR;
            end       
            ADDI: begin 
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_ADD;        
            end
            ADDIU: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_ADD;        
            end
            ANDI: begin
                cuif.ALUSrc = 1'b1;
                cuif.MemtoReg = 1'b0;
                cuif.RegWr = 1'b1;
                cuif.dWEN = 1'b0;
                cuif.ExtOp = 2'd0;
                cuif.ALUOP = ALU_AND;        
            end
            SW: begin
                cuif.ALUSrc = 1'b1;
                cuif.RegWr = 1'b0;
                cuif.dWEN = 1'b1;
                cuif.ExtOp = 2'd1;
                cuif.ALUOP = ALU_ADD;
                cuif.PCSrc = 3'd0;
            end         
        endcase       
    end
end

endmodule