`ifndef PROGRAM_COUNTER_IF_VH
`define PROGRAM_COUNTER_IF_VH

// types
`include "cpu_types_pkg.vh"

interface program_counter_if;
  // import types
  import cpu_types_pkg::*;

  logic               PCen;
  word_t              pc, npc, cpc;

  // pc ports
  modport pcm (
    input   PCen, cpc,
    output  pc, npc
  );
  // testbench program
  modport tb (
    input   pc, npc,
    output  PCen, cpc
  );
endinterface

`endif //Program_counter_IF_VH