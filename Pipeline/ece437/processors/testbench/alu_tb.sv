`include "alu_if.vh"
`include "cpu_types_pkg.vh"
`timescale 1 ns / 1 ns

module alu_tb;
    
    alu_if aluif();
    parameter PERIOD = 10;
    string test_case;
    int test_num;
    
    test PROG(aluif);

    `ifndef MAPPED
        alu DUT(aluif);
    `else
        alu DUT(
            .\aluif.ALUOP (aluif.ALUOP),
            .\aluif.portA (aluif.portA),
            .\aluif.portB (aluif.portB),
            .\aluif.portOut (aluif.portOut),
            .\aluif.Neg (aluif.Neg),
            .\aluif.Over (aluif.Over),
            .\aluif.Zero (aluif.Zero)
        );
    `endif

endmodule

import cpu_types_pkg::*;
program test (alu_if.alu aluif);

    initial begin
        //test 1: sll
        alu_tb.test_case = "Shift left logical";
        alu_tb.test_num = 1;

        aluif.ALUOP = ALU_SLL;
        aluif.portA = 32'h0003;
        aluif.portB = 32'h0004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 2: srl
        alu_tb.test_case = "Shift right logical";
        alu_tb.test_num = 2;

        aluif.ALUOP = ALU_SRL;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 3: signed add and negative flag
        alu_tb.test_case = "Signed add and negative flag";
        alu_tb.test_num = 3;

        aluif.ALUOP = ALU_ADD;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'hf0000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 4: sub
        alu_tb.test_case = "signed sub";
        alu_tb.test_num = 4;

        aluif.ALUOP = ALU_SUB;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 5: and + zero flag test
        alu_tb.test_case = "and & zero flag";
        alu_tb.test_num = 5;

        aluif.ALUOP = ALU_AND;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 6: or
        alu_tb.test_case = "or";
        alu_tb.test_num = 6;

        aluif.ALUOP = ALU_OR;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 7: xor
        alu_tb.test_case = "xor";
        alu_tb.test_num = 7;

        aluif.ALUOP = ALU_XOR;
        aluif.portA = 32'h00000005;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 8: nor
        alu_tb.test_case = "nor";
        alu_tb.test_num = 8;

        aluif.ALUOP = ALU_NOR;
        aluif.portA = 32'h00000005;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD); 

        //test 9: signed less than
        alu_tb.test_case = "signed less than";
        alu_tb.test_num = 9;

        aluif.ALUOP = ALU_SLT;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'hf0000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);

        //test 10: unsigned less than
        alu_tb.test_case = "unsigned less than";
        alu_tb.test_num = 10;

        aluif.ALUOP = ALU_SLTU;
        aluif.portA = 32'h00000003;
        aluif.portB = 32'hf0000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);  

        //test 11: overflow
        alu_tb.test_case = "overflow";
        alu_tb.test_num = 11;

        aluif.ALUOP = ALU_ADD;
        aluif.portA = 32'h7fffffff;
        aluif.portB = 32'h00000004;

        #(alu_tb.PERIOD);
        #(alu_tb.PERIOD);     
    end

endprogram