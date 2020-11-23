`ifndef MEMORY_IF_VH
`define MEMORY_IF_VH
`include "cpu_types_pkg.vh"

interface memory_if;
    import cpu_types_pkg::*;

    logic dhit, halt;
    word_t dmemload, dmemaddr, memReg_r, memReg_n, dstore,
        npc, npc_r, extOut, extOut_r;
    regbits_t wreg, wreg_r;
    logic jaltype, ldtype, PCSrc, Reg_Wen,
        dwen, dren, jtype, MemToReg, immtype, jrtype;
    logic jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
        jtype_r, immtype_r, halt_r, jrtype_r;
    opcode_t opcode, opcode_r, opcode_curr;
    modport mem (
        input dmemload, dhit, dmemaddr, wreg, npc, extOut,
            jaltype, ldtype, PCSrc, Reg_Wen, dwen, dren, dstore,
            jtype, MemToReg, immtype, halt, jrtype, opcode,
        output memReg_r, npc_r, extOut_r, wreg_r,
            jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
            jtype_r, immtype_r, halt_r, memReg_n, jrtype_r, opcode_r, opcode_curr
    );
endinterface

`endif
