`include "program_counter_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module program_counter_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  program_counter_if pcif ();
  // test program
  test PROG (CLK, nRST, pcif);
  // DUT
  program_counter DUT(CLK, nRST, pcif);

endmodule

program test (input logic CLK, output logic rst, program_counter_if.tb pcif);


  //test bench debug signals
  integer tb_test_num;
  string tb_test_case;

  initial begin
     tb_test_num = -1;
     tb_test_case = "TB init";
     rst = 1'b0;
     @(negedge CLK);
     rst = 1'b1;

     //away from time 0
     #0.1;

     reset_dut();

     tb_test_num += 1;
     tb_test_case = "PC Enable";
     pcif.PCen = 1'b0;
     pcif.cpc = 32'h0005;

     #(20)

     @(negedge CLK)
     pcif.PCen = 1'b1;
     pcif.cpc = pcif.npc;

     #(50);

     pcif.cpc = 32'h5555555;
     @(negedge CLK)
     pcif.cpc = 32'hAAAAAAA;
     @(negedge CLK)
     pcif.PCen = 1'b0;
     pcif.cpc = 32'hBEEFB00B;
     reset_dut();

     $finish;
  end


  task reset_dut;
        begin
            @(negedge CLK);
            rst = 0;
            @(posedge CLK);
            rst = 1;
         end
  endtask
endprogram
