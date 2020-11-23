`include "cpu_types_pkg.vh"
`include "decoder_if.vh"

module decoder(
    decoder_if.d dif
);
    import cpu_types_pkg::*;

    opcode_t op;

    always_comb begin
        op = opcode_t'(dif.instr[31:26]);
        dif.opcode = opcode_t'('0);
        dif.rd = '0;
        dif.rs = '0;
        dif.rt = '0;
        dif.imm16 = '0;
        dif.funct = funct_t'('0);
        dif.imm26 = '0;

        casez(op)
        RTYPE: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.rd =  dif.instr[15:11];
            dif.funct = funct_t'(dif.instr[5:0]);
        end
        J: begin
            dif.opcode = op;
            dif.imm26 = dif.instr[25:0];
        end
        JAL: begin
            dif.opcode = op;
            dif.imm26 = dif.instr[25:0];
        end
        BEQ: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        BNE: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        ADDI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        ADDIU: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        SLTI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        SLTIU: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        ANDI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        ORI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        XORI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        LUI: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        LW: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        SW: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0]; 
        end
        LL: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0];
        end
        SC: begin
            dif.opcode = op;
            dif.rs = dif.instr[25:21];
            dif.rt = dif.instr[20:16];
            dif.imm16 = dif.instr[15:0];
        end
        HALT: begin
            dif.opcode = op;
        end
        endcase
    end

endmodule