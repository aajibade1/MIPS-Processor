`ifndef EXTENDER_IF_VH
`define EXTENDER_IF_VH

`include "cpu_types_pkg.vh"

interface extender_if;
    //import
    import cpu_types_pkg::*;

    logic[15:0] imm16;
    logic[25:0] imm26;
    logic [1:0] ExtOp;
    logic immtype;
    word_t imm32;
    
    modport ex (
        input imm16, imm26, ExtOp, immtype,
        output imm32
    );

    modport tb (
        output imm16, imm26, ExtOp, immtype,
        input imm32
    );

endinterface
`endif