`ifndef HAZARD_UNIT_IF_VH
`define HAZARD_UNIT_IF_VH

`include "cpu_types_pkg.vh"

interface hazard_unit_if;
    //imports
    import cpu_types_pkg::*;

    logic   drenEX, dwen_id, stall, flush, halttype, dcEN, wbEN, memEN, exEN;
    regbits_t rs_id, rt_id, rtEX, rtMEM;

    modport hu (
        input   rs_id, rt_id, rtEX, drenEX, dwen_id, rtMEM,
        output  dcEN, exEN, memEN, wbEN, halttype, stall, flush
    );

    modport tb (
        output   rs_id, rt_id, rtEX, drenEX, rtMEM,
        input  dcEN, exEN, memEN, wbEN, halttype, stall, flush
    );
endinterface

`endif