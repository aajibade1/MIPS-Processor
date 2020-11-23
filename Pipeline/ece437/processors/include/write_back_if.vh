`ifndef WRITE_BACK_IF_VH
`define WRITE_BACK_IF_VH
`include "cpu_types_pkg.vh"

interface write_back_if;
    import cpu_types_pkg::*;

    regbits_t wreg;
    word_t memReg, npc, extOut;
    logic jaltype, ldtype, PCSrc, Reg_Wen,
        jtype, immtype;
    funct_t funct;
    opcode_t opcode;
    regbits_t rs, rt;
    word_t instr, pc,imm32, branchAddr, portout, rdat2;
    logic[15:0] imm16;


    modport wr (
        input wreg, memReg, npc, extOut, jaltype, ldtype, PCSrc,
            Reg_Wen, jtype, immtype,instr, pc,imm32, branchAddr, portout, rdat2,
            rs, rt, opcode, funct
    );

endinterface
`endif