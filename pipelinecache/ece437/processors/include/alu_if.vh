`ifndef ALU_IF_VH
`define ALU_IF_VH

`include "cpu_types_pkg.vh"

interface alu_if;
    //imports
    import cpu_types_pkg::*;

    aluop_t ALUOP;
    word_t portA, portB, portOut;
    logic Neg, Over, Zero;

    //alue ports
    modport alu (
        input ALUOP, portA, portB,
        output Neg, Over, Zero, portOut
    );

    //alu tb ports
    modport tb (
        input Neg, Over, Zero, portOut,
        output ALUOP, portA, portB
    );

endinterface

`endif