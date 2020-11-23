/*
  Eric Villasenor
  evillase@gmail.com

  register file interface
*/
`ifndef CONTROL_UNIT_IF_VH
`define CONTROL_UNIT_IF_VH

// all types
`include "cpu_types_pkg.vh"

interface control_unit_if;
  // import types
  import cpu_types_pkg::*;

  logic   JALen,RegWr,ALUSrc,dWEN, MemtoReg, halt, beq,dREN, iREN, dhit, ihit;
  logic [2:0] PCSrc;
  logic [1:0] ExtOp, RegDst;
  aluop_t ALUOP;
  word_t imemload;
  regbits_t rs, rd,rt;
  logic [IMM_W-1:0]   imm;

  // control unit ports
  modport cu (
    input   imemload,dhit,ihit,
    output  JALen, RegWr, ALUSrc, dWEN, MemtoReg, RegDst, PCSrc, ExtOp, ALUOP, halt, rs,rd,rt,imm, iREN,dREN, beq
  );
  // control unit tb
  modport tb (
    input   JALen, RegWr, ALUSrc, dWEN, MemtoReg, RegDst, PCSrc, ExtOp, ALUOP, halt, rs,rd,rt,imm, iREN,dREN,beq,
    output  imemload,dhit, ihit
  );
endinterface

`endif //CONTROL_UNIT_IF_VH
