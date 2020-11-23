`ifndef DECODE_IF_VH
`define DECODE_IF_VH
`include "cpu_types_pkg.vh"

interface decode_if;
    import cpu_types_pkg::*;
    
    regbits_t wreg_r, rs_r, rt_r;
    opcode_t opcode_r;
    word_t instr, npc, rdat1_r, rdat2_r, bdat_r, extOut_r, npc_r; 
    logic jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r, 
            dwen_r, dren_r, jtype_r, MemToReg_r,
            jrtype_r, immtype_r, halt_r, alutype_r;
    logic branch, branch_r;
    aluop_t ALUOP_r;


    modport decode (
        input instr, npc, branch,
        output  rdat1_r, rdat2_r, bdat_r, extOut_r, npc_r, wreg_r, rs_r, rt_r,
                jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r, dwen_r, alutype_r, 
                dren_r, jtype_r,  MemToReg_r, ALUOP_r,
                jrtype_r, immtype_r, opcode_r, halt_r, branch_r
    );
    modport tb (
        output instr, npc,
        input  rdat1_r, rdat2_r, bdat_r, extOut_r, npc_r, wreg_r,
                jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r, dwen_r, 
                dren_r, jtype_r, MemToReg_r, ALUOP_r,
                jrtype_r, immtype_r, opcode_r, halt_r
    );
     
endinterface

`endif