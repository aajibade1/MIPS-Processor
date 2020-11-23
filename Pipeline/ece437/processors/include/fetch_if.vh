`ifndef FETCH_IF_VH
`define FETCH_IF_VH

`include "cpu_types_pkg.vh"

interface fetch_if;

    import cpu_types_pkg::*;

    logic iren, branch, immtype;
    word_t iaddr, imemload, instr_r, npc_r, branchTarget, branchAddr_r;

    modport fetch (
        input imemload,
        output instr_r, npc_r, iren, iaddr, branch, immtype, branchTarget, branchAddr_r
    );

endinterface
`endif