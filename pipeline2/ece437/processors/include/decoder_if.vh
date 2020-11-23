`ifndef DECODER_IF_VH
`define DECODER_IF_VH

`include "cpu_types_pkg.vh"

interface decoder_if;
    //imports
    import cpu_types_pkg::*;

    word_t  instr;
    regbits_t rd, rs, rt;
    logic[15:0] imm16;
    logic[25:0] imm26;
    opcode_t opcode;
    funct_t funct;

    modport d (
        input instr,
        output rd, rs, rt, imm16, opcode, funct, imm26
    );
    
    modport tb (
        output instr,
        input rd, rs, rt, imm16, opcode, funct, imm26
    );

endinterface
`endif