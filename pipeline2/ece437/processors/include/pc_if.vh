`ifndef PC_IF_VH
`define PC_IF_VH

`include "cpu_types_pkg.vh"

interface pc_if;
    //imports
    import cpu_types_pkg::*;

    logic   jtype, halttype, PCSrc, immtype;
    word_t  immAddr, aluAddr, PCOut, npc, npc_r, nPCOut, pcDst;

    modport pc (
        input   jtype, npc, halttype, PCSrc, immAddr, aluAddr, immtype,
        output  PCOut, npc_r, nPCOut,pcDst
    );

    modport tb (
        output   jtype, halttype, npc, PCSrc, immAddr, aluAddr, immtype,
        input  PCOut, npc_r
    );
endinterface

`endif