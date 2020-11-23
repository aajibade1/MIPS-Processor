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

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  register_file_if rfif ();
  // test program
  test PROG (CLK, nRST, rfif);
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

program test(input logic clk, output logic rst, register_file_if.tb tbinf);

  // test vars
  int v1 = 1;
  int v2 = 4721;
  int v3 = 25119;

  //test bench debug signals
  integer tb_test_num;
  string tb_test_case;

  initial begin
    tb_test_num = -1;
    tb_test_case = "TB init";
    tbinf.wdat = '0;
    tbinf.wsel = '0;
    tbinf.WEN = '0;
    tbinf.rsel1 = '0;
    tbinf.rsel2 = '0;
    rst = 1'b1;

    //away from time 0
    #0.1;

/***************************************
    // Test 1 - Asynchronous Reset Test
***************************************/
    tb_test_num += 1;
    tb_test_case = "Asyncronous Reset";
    reset_dut();
/****************************************
    //Test 2 - Write to registers
****************************************/
    @(negedge clk);
    tb_test_num += 1;
    tb_test_case = "Write to register check";

    //turn on write enable
    tbinf.WEN = 1'b1;
    for(int i = 0; i < 32; i++) begin
      v1 += 2;
      tbinf.wsel = i;
      tbinf.wdat = v1;
      #(10);
    end

    //turn off write enable
    @(negedge clk);
    tbinf.WEN = 1'b0;
/********************************************
    //Test 3 - Read and write from registers
********************************************/
    reset_dut();
    @(negedge clk);
    tb_test_num += 1;
    tb_test_case = "Write to register and read values back";

    tbinf.WEN = 1'b1;
    for(int i = 0; i < 32; i++) begin
      tbinf.wsel = i;
      tbinf.wdat = v2;
      v2 -= 100;
      #(10);
    end
    tbinf.WEN = 1'b0;

    for(int i = 0; i < 32; i++) begin
      if(i < 16) begin
          tbinf.rsel1 = i;
      end
      else begin
          tbinf.rsel2 = i;
      end
      #(10);
    end

/*******************************************
    //Test 4 - Write to register 0 check
*******************************************/
    @(negedge clk);
    tb_test_num += 1;
    tb_test_case = "Zero Register write check";

    tbinf.WEN = 1'b1;
    tbinf.wsel = 0;
    tbinf.wdat = v3;

    @(negedge clk);
    tbinf.WEN = 1'b0;
    tbinf.rsel1 = 0;
    tbinf.rsel2 = 0;

    #(50);
  end

 task reset_dut;
   begin
    @(negedge clk);
      rst = 0;
    @(posedge clk);
      rst = 1;
   end
 endtask
endprogram
