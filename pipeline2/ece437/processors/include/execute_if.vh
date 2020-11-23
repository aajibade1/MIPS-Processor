`ifndef EXECUTE_IF_VH
`define EXECUTE_IF_VH
`include "cpu_types_pkg.vh"

interface execute_if;

    import cpu_types_pkg::*;

    logic jaltype, ldtype, PCSrc, Reg_Wen, 
            dwen, dren, jtype, RegDst, MemToReg,
            jrtype, immtype, dhit, halt;
    logic[1:0] forwardA, forwardB;
    word_t portA, portB, dstore, extOut, npc;
    aluop_t ALUOP;
    regbits_t wreg_r, wreg;
    opcode_t opcode, opcode_r;
    logic Zero_r, jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
            dwen_r, dren_r, jtype_r, RegDst_r, MemToReg_r,
            immtype_r, halt_r, PCSrc_n, jrtype_r;
    word_t portOut_r, dstore_r, extOut_r, npc_r, portA_mem, rd_wb, rd_mem;

    logic branch, branch_r;

    modport execute (
        input portA, portB, dstore, extOut, npc, wreg,
            jaltype, ldtype, PCSrc, Reg_Wen, halt,
            dwen, dren, jtype, RegDst, MemToReg, branch,
            jrtype, immtype, ALUOP, opcode, dhit, rd_mem, rd_wb, forwardA, forwardB,
        output portOut_r, Zero_r, npc_r, dstore_r, extOut_r, wreg_r,
            jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
            dwen_r, dren_r, jtype_r, RegDst_r, MemToReg_r,
            immtype_r, halt_r, opcode_r, PCSrc_n, jrtype_r, branch_r
    );
    modport tb (
        output portA, portB, dstore, extOut, npc, wreg,
            jaltype, ldtype, PCSrc, Reg_Wen, halt,
            dwen, dren, jtype, RegDst, MemToReg,
            jrtype, immtype, ALUOP, opcode, dhit,
        input portOut_r, Zero_r, npc_r, dstore_r, extOut_r, wreg_r,
            jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
            dwen_r, dren_r, jtype_r, RegDst_r, MemToReg_r,
            immtype_r, halt_r, opcode_r, PCSrc_n
    );
endinterface

`endif