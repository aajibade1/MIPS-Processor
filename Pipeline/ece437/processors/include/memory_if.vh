`ifndef MEMORY_IF_VH
`define MEMORY_IF_VH
`include "cpu_types_pkg.vh"

interface memory_if;
    import cpu_types_pkg::*;

    logic dhit, halt, wbEN;
    word_t dmemload, dmemaddr, memReg_r, memReg_n, dstore,
        npc, npc_r, extOut, extOut_r, dstore_r;
    regbits_t wreg, wreg_r;
    logic jaltype, ldtype, PCSrc, Reg_Wen,
        dwen, dren, jtype, MemToReg, immtype;
    logic jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
        jtype_r, immtype_r, halt_r; 

    funct_t wb_funct, wb_funct_r;
    opcode_t wb_opcode, wb_opcode_r;
    regbits_t wb_rs, wb_rt, wb_rs_r, wb_rt_r;
    word_t wb_instr, wb_pc,wb_branchAddr, wb_portout, wb_rdat2;
    word_t wb_instr_r, wb_pc_r,wb_branchAddr_r, wb_portout_r, wb_rdat2_r;
    logic[15:0] wb_imm16, wb_imm16_r;

    modport mem (
        input dmemload, dhit, dmemaddr, wreg, npc, extOut,
            jaltype, ldtype, PCSrc, Reg_Wen, dwen, dren, dstore,
            jtype, MemToReg, immtype, halt,wb_instr, wb_pc,wb_branchAddr, wb_portout, wb_rdat2,
            wb_imm16,wb_rs, wb_rt,wb_opcode,wb_funct,
        output memReg_r, npc_r, extOut_r, wreg_r,
            jaltype_r, ldtype_r, PCSrc_r, Reg_Wen_r,
            jtype_r, immtype_r, halt_r, memReg_n, wbEN, wb_instr_r, wb_pc_r,wb_branchAddr_r, wb_portout_r, wb_rdat2_r,
            wb_rs_r, wb_rt_r,wb_opcode_r,wb_funct_r,wb_imm16_r, dstore_r
    );
endinterface

`endif
