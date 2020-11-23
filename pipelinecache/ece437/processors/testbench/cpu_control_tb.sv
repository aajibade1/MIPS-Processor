`include "cpu_types_pkg.vh"
`include "cpu_control_if.vh"
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;

module cpu_control_tb;

    cpu_control_if ccif();
    parameter PERIOD = 10;
    string test_case;
    int test_num;

    // signals
    logic CLK = 0, nRST;

    // clock
    always #(PERIOD/2) CLK++;

    test PROG(CLK, ccif);

    cpu_control DUT (ccif);

endmodule

program test (input logic CLK, cpu_control_if.tb tbif);
    initial begin
        tbif.zero = 0;
        tbif.opcode = opcode_t'('0);
        tbif.dhit = 0;
        tbif.funct = funct_t'('0);
        tbif.ihit = 0;
        tbif.halt = 0;

    //test0
    cpu_control_tb.test_num = 0;
    cpu_control_tb.test_case = "ADD rtype";

    tbif.opcode = RTYPE;
    tbif.funct = ADD;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    
    //test1
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "JR rtype";

    tbif.opcode = RTYPE;
    tbif.funct = JR;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    
    //test2
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "J";

    tbif.opcode = J;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    
    //test3
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "JAL";

    tbif.opcode = JAL;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    
    //test4
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "ANDI";

    tbif.opcode = ANDI;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    
    //test5
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "LW";

    tbif.opcode = LW;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    tbif.dhit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    tbif.dhit = 0;

    //test6
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "SW";

    tbif.opcode = SW;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    tbif.dhit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    tbif.dhit = 1;
    @(posedge CLK);
    
    //test7
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "LUI";

    tbif.opcode = LUI;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);

    //test8
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "HALT";

    tbif.opcode = HALT;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);

    //test9
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "BEQ";

    tbif.opcode = BEQ;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);

    //test10
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "BNE";

    tbif.opcode = BNE;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);

    //test11
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "ORI";

    tbif.opcode = ORI;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;

    //test11
    cpu_control_tb.test_num += 1;
    cpu_control_tb.test_case = "SLTI";

    tbif.opcode = SLTI;
    @ (posedge CLK);
    tbif.ihit = 1;
    @ (posedge CLK);
    @ (posedge CLK);
    tbif.ihit = 0;
    $finish;
    end
endprogram