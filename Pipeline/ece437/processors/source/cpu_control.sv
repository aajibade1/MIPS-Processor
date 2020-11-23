`include "cpu_control_if.vh"
`include "cpu_types_pkg.vh"

module cpu_control(
    cpu_control_if.cc ccif
);
    import cpu_types_pkg::*;

    always_comb begin
        ccif.jaltype = 1'b0;
        ccif.ldtype = 1'b0;
        ccif.ExtOp = 2'b0;
        ccif.alutype = 1'b0;
        ccif.PCSrc = 1'b0;
        ccif.Reg_Wen = 1'b0;
        ccif.dwen = 1'b0;
        ccif.dren = 1'b0;
        ccif.iren = 1'b1; //should always fetch instructions
        ccif.jtype = 1'b0;
        ccif.RegDst = 1'b0;
        ccif.MemToReg = 1'b0;
        ccif.ALUOP = aluop_t'('0);
        ccif.jrtype = 1'b0;
        ccif.immtype = 1'b0;
        //ccif.ffEN = 1'b0;
        ccif.halt = 1'b0;

        //if (ccif.ihit || ccif.dhit)
        //begin
            casez(ccif.opcode)
            RTYPE: begin
                casez(ccif.funct)
                SLLV: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SLL;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                SRLV: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SRL;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                JR: begin
                    ccif.jrtype = 1;
                    ccif.ALUOP = ALU_ADD;
                    ccif.jtype = 0;
                    ccif.PCSrc = 1;
                end
                ADD: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_ADD;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                ADDU: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_ADD;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                SUB: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SUB;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                SUBU: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SUB;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                AND: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_AND;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                OR: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_OR;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                XOR: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_XOR;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                NOR: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_NOR;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                SLT: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SLT;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                SLTU: begin
                    ccif.RegDst = 0;
                    ccif.jaltype = 0;
                    ccif.alutype = 0;
                    ccif.jrtype = 0;
                    ccif.ALUOP = ALU_SLTU;
                    ccif.MemToReg = 0;
                    ccif.ldtype = 0;
                    ccif.Reg_Wen = 1;
                end
                funct_t'('0): begin
                end
                endcase
            end
            //i-type instructions
            ADDIU: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 2; //sign ext
                ccif.ALUOP = ALU_ADD;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.Reg_Wen = 1;
            end
            ADDI: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 2; //sign ext
                ccif.ALUOP = ALU_ADD;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.Reg_Wen = 1;
            end
            ANDI: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 0; //zero ext
                ccif.ALUOP = ALU_AND;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.Reg_Wen = 1;
            end
            BEQ: begin
                ccif.RegDst = 0;
                ccif.jaltype = 0;
                ccif.alutype = 0;
                ccif.ExtOp = 0; //zero ext
                ccif.ALUOP = ALU_SUB;
                ccif.jtype = 1;
                ccif.PCSrc = 1;
            end
            BNE: begin//
                ccif.RegDst = 0;
                ccif.jaltype = 0;
                ccif.alutype = 0;
                ccif.ExtOp = 0; //zero ext
                ccif.ALUOP = ALU_SUB;
                ccif.jtype = 1;
                ccif.PCSrc = 1;
            end
            LUI: begin
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.ExtOp = 1; //zero append
                ccif.ldtype = 1;
                ccif.Reg_Wen = 1;
            end
            LW: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.immtype = 0;
                ccif.ExtOp = 2;//sign ext
                ccif.ALUOP = ALU_ADD;
                ccif.dren = 1;
                
                ccif.MemToReg = 1;
                ccif.ldtype = 0;
                ccif.jaltype = 0;
                ccif.Reg_Wen = 1;
            end
            ORI: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 0; //zero ext
                ccif.ALUOP = ALU_OR;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.Reg_Wen = 1;
            end
            SLTI: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 2; //sign ext
                ccif.jrtype = 0;
                ccif.ALUOP = ALU_SLT;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.jaltype = 0;
                ccif.Reg_Wen = 1;               
            end
            SLTIU: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 2; //sign ext
                ccif.jrtype = 0;
                ccif.ALUOP = ALU_SLT;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.jaltype = 0;
                ccif.Reg_Wen = 1;
            end
            SW: begin//
                ccif.RegDst = 0;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 2; //sign ext
                ccif.immtype = 0;
                ccif.jrtype = 0;
                ccif.ALUOP = ALU_ADD;
                ccif.dwen = 1;
            end
            XORI: begin//
                ccif.RegDst = 1;
                ccif.jaltype = 0;
                ccif.alutype = 1;
                ccif.ExtOp = 0; //zero ext
                ccif.ALUOP = ALU_XOR;
                ccif.MemToReg = 0;
                ccif.ldtype = 0;
                ccif.Reg_Wen = 1;
            end
            //j-type instructions
            J: begin
                ccif.ExtOp = 0;
                ccif.immtype = 1;
                ccif.jtype = 1;
                ccif.PCSrc = 1;
            end
            JAL: begin
                ccif.jaltype = 1;
                ccif.Reg_Wen = 1;
                ccif.ExtOp = 0;
                ccif.immtype = 1;
                ccif.jtype = 1;
                ccif.PCSrc = 1;
            end
            HALT: begin
                ccif.halt = 1;
            end
            endcase
        //end
    end

endmodule