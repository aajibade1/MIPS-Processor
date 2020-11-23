/*
  Eric Villasenor
  evillase@gmail.com

  register file test bench
*/

// mapped needs this
`include "register_file_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module register_file_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST = 1;

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  string test_case;
  int test_case_num;
  int wait_var;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG ();
  // DUT
`ifndef MAPPED
  register_file DUT(CLK, nRST, rfif);
`else
  register_file DUT(
    .\rfif.rdat2 (rfif.rdat2),
    .\rfif.rdat1 (rfif.rdat1),
    .\rfif.wdat (rfif.wdat),
    .\rfif.rsel2 (rfif.rsel2),
    .\rfif.rsel1 (rfif.rsel1),
    .\rfif.wsel (rfif.wsel),
    .\rfif.WEN (rfif.WEN),
    .\nRST (nRST),
    .\CLK (CLK)
  );
`endif

endmodule

program test;
    
  task reset_dut;
  begin
    register_file_tb.nRST = 1'b0;

    @(posedge register_file_tb.CLK);
    @(posedge register_file_tb.CLK);

    @(negedge register_file_tb.CLK);
    register_file_tb.nRST = 1'b1;

    @(negedge register_file_tb.CLK);
  end
  endtask

  initial begin
    //Test 1: Power-on Reset 
    register_file_tb.test_case = "Power-on Reset";
    register_file_tb.test_case_num = 0;
    #(register_file_tb.PERIOD);
    reset_dut();
    #(register_file_tb.PERIOD);

    //Write to Reg-0
    register_file_tb.test_case = "Write to Reg-0";
    register_file_tb.test_case_num = 1;
    #(register_file_tb.PERIOD);
    rfif.WEN = 1'b0;
    rfif.wdat = register_file_tb.v3;
    rfif.wsel = 5'b0;
    #(register_file_tb.PERIOD);
    rfif.WEN = 1'b1;
    #(register_file_tb.PERIOD);
    rfif.WEN = 1'b0;
    rfif.rsel1 = 5'b0;


    //Write/Read from All Regs
    register_file_tb.test_case = "Write to/Read from All Regs";
    register_file_tb.test_case_num = 2;
    #(register_file_tb.PERIOD);
    rfif.wdat = register_file_tb.v2;
    for (register_file_tb.wait_var = 0; register_file_tb.wait_var < 32; register_file_tb.wait_var++) 
    begin
      rfif.wsel = register_file_tb.wait_var;
      #(register_file_tb.PERIOD);

      rfif.WEN = 1'b1;
      #(register_file_tb.PERIOD);
      
      rfif.WEN = 1'b0;
      rfif.rsel1 = register_file_tb.wait_var;
      #(register_file_tb.PERIOD);
    end
    reset_dut();
    #(register_file_tb.PERIOD);
  end


endprogram
