`ifndef FORWARD_UNIT_IF_VH
`define FORWARD_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface forward_unit_if;

    import cpu_types_pkg::*;

    word_t rd_mem, rd_wb;
    logic[1:0] forwardA, forwardB;
    logic Mem_RegWrite, Wb_RegWrite, Mem_dren, alutype, ID_dwen, jaltype_wb;
    regbits_t rs, rt;

    modport fu (
        input rd_mem, rd_wb, rs, rt, Mem_RegWrite, Wb_RegWrite, Mem_dren, ID_dwen, alutype, jaltype_wb,
        output forwardA, forwardB
    );

    modport tb (
        output rd_mem, rd_wb, rs, rt, Mem_RegWrite, Wb_RegWrite, Mem_dren, ID_dwen, alutype, jaltype_wb,
        input forwardA, forwardB 
    );

endinterface
`endif