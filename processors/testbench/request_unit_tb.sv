`include "request_unit_if.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module request_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  request_unit_if ruif ();
  // test program
  test PROG (CLK, nRST, ruif);
  // DUT
  request_unit DUT(CLK, nRST, ruif);

endmodule

program test (input logic CLK, output logic rst, request_unit_if.tb ruif);


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
     for(int i = 0; i < 2; i++) begin
          ruif.dhit = i;
           #(10);
          for(int j = 0; j < 2; j++) begin
            ruif.ihit = j;
             #(10);
            for(int k = 0; k < 2; k++) begin
                ruif.dREN = k;
                 #(10);
                     for(int l = 0; l < 2; l++) begin
                        ruif.dWEN = l;
                         #(10);
                end
            end
        end
     end
     ruif.dhit = 1'b0; 
      #(10);
    $finish;
  end


  task reset_dut;
        begin
            repeat(2)
                @(negedge CLK);
            rst = 0;
            repeat(2)
            @(posedge CLK);
            rst = 1;
         end
  endtask
endprogram
