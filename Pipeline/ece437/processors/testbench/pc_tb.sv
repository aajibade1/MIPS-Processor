`include "cpu_types_pkg.vh"
`include "pc_if.vh"
`timescale 1 ns / 1 ns
import cpu_types_pkg::*;

module pc_tb;

    // clock period
    parameter PERIOD = 20;

    // signals
    logic CLK = 0, nRST;

    // clock
    always #(PERIOD/2) CLK++;

    pc_if pif();
    string test_case;
    int test_num;

    test PROG(CLK, nRST, pif);

    pc #(8) DUT (CLK, nRST, pif);

endmodule

program test (input logic CLK, nRST, pc_if.tb tbif);
    initial begin
        //pc_tb.nRST = 0;
        //@(posedge CLK);
        pc_tb.nRST = 1;
        tbif.jtype = 0;
        tbif.halttype = 0;
        tbif.PCSrc = 0;
        tbif.immAddr = '0;
        tbif.aluAddr = '0;

        //test 0: halted
        tbif.halttype = 0;
        @ (posedge CLK);

        //test 1: normal function
        tbif.halttype = 1;
        @ (posedge CLK);

        //test 2: j instr
        tbif.halttype = 1;
        tbif.jtype = 1;
        tbif.immAddr = 16'd544;
        @ (posedge CLK);
        

        //test 3
        tbif.halttype = 1;
        tbif.jtype = 0;
        tbif.PCSrc = 1;
        tbif.aluAddr = 32'd439;
        @ (posedge CLK);

        //test 4
        tbif.halttype = 1;
        tbif.jtype = 1;
        tbif.PCSrc = 1;
        tbif.immAddr = 16'd487;
        @ (posedge CLK);

        //test 5
        tbif.halttype = 1;
        tbif.jtype = 1;
        tbif.PCSrc = 1;
        tbif.immtype = 0;
        tbif.immAddr = 16'd238;
        @ (posedge CLK);
    
        //test 6
        tbif.halttype = 1;
        tbif.jtype = 1;
        tbif.PCSrc = 1;
        tbif.immtype = 1;
        tbif.immAddr = 26'd1624;
        @ (posedge CLK);
        $finish;
    end
endprogram