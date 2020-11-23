/*
  Rahmna Ajibade
  don't email me

  alu interface
*/
`ifndef ALU_IF_VH
`define ALU_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface alu_if;
  // import types
  import cpu_types_pkg::*;

  logic     ZERO;
  logic     OVF;
  logic     NEG;
  word_t    PORTA, PORTB, OUTPORT;
  aluop_t   ALUOP;

  // alu ports
  modport alu (
    input   PORTA, PORTB, ALUOP,
    output  ZERO, OVF, NEG, OUTPORT
  );
  // alu tb
  modport tb (
    input   ZERO, OVF, NEG, OUTPORT,
    output  PORTA, PORTB, ALUOP
  );
endinterface

`endif //ALU_IF_VH
