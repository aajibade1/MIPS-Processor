`ifndef WRITE_BACK_IF_VH
`define WRITE_BACK_IF_VH
`include "cpu_types_pkg.vh"

interface write_back_if;
    import cpu_types_pkg::*;

    regbits_t wreg;
    word_t memReg, npc, extOut;
    logic jaltype, ldtype, PCSrc, Reg_Wen,
        jtype, immtype, wbEN;


    modport wr (
        input wreg, memReg, npc, extOut, jaltype, ldtype, PCSrc,
            Reg_Wen, jtype, immtype,
        output wbEN
    );

endinterface
`endif