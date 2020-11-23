`ifndef CPU_CONTROL_IF_VH
`define CPU_CONTROL_IF_VH

`include "cpu_types_pkg.vh"

interface cpu_control_if;
    //imports
    import cpu_types_pkg::*;

    logic   zero, jaltype, ldtype, alutype, PCSrc, ihit, halt, immtype, datomic;
    logic   Reg_Wen, dwen, dren, RegDst, jtype, iren, MemToReg, dhit, jrtype;
    logic [1:0] ExtOp;
    opcode_t opcode;
    funct_t funct;
    aluop_t ALUOP;
    //word_t  instr;


    modport cc(
        input   zero, opcode, dhit, funct, ihit,
        output  jaltype, ldtype, ExtOp, alutype, PCSrc,
                Reg_Wen, dwen, dren, iren, jtype, RegDst, MemToReg, ALUOP,
                jrtype, immtype, halt
    );
    
    modport tb(
        input  jaltype, ldtype, ExtOp, alutype, PCSrc, 
                Reg_Wen, dwen, dren, iren, jtype, RegDst, MemToReg, ALUOP,
                jrtype, immtype,
        output  zero, opcode, dhit, funct, ihit, halt
    );

endinterface
`endif