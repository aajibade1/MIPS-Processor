`ifndef FETCH_IF_VH
`define FETCH_IF_VH

`include "cpu_types_pkg.vh"

interface fetch_if;

    import cpu_types_pkg::*;

    logic iren, branch, immtype, branch_r;
    word_t iaddr, imemload, instr_r, npc_r, branchTarget;

    modport fetch (
        input imemload,
        output instr_r, npc_r, iren, iaddr, branch, immtype, branchTarget, branch_r
    );

endinterface
`endif