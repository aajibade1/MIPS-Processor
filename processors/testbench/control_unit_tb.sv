`include "control_unit_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module control_unit_tb;

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  control_unit_if cuif ();
  // test program
  test PROG (CLK, nRST, cuif);
  // DUT
  control_unit DUT(cuif);

endmodule

import cpu_types_pkg::*;

program test (input logic CLK, output logic rst, control_unit_if.tb cuif);

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
     #10;

     cuif.imemload[31:26] = RTYPE;
     cuif.imemload[5:0] = ADD;
     cuif.imemload[25:21] = 5'd1;
     cuif.imemload[20:16]  = 5'd2;
     cuif.imemload[15:11] = 5'd3;

    #(50) 

     cuif.imemload[5:0] = SUB;
     cuif.imemload[25:21] = 5'd1;
     cuif.imemload[20:16]  = 5'd2;
     cuif.imemload[15:11] = 5'd3;

    #(50) 

     cuif.imemload[5:0] = ADDU;
     cuif.imemload[25:21] = 5'd2;
     cuif.imemload[20:16]  = 5'd5;
     cuif.imemload[15:11] = 5'd6;

    #(50) 

     cuif.imemload[5:0] = SUBU;
     cuif.imemload[25:21] = 5'd3;
     cuif.imemload[20:16]  = 5'd4;
     cuif.imemload[15:11] = 5'd5;


    #(50) 

     cuif.imemload[5:0] = AND;
     cuif.imemload[25:21] = 5'd3;
     cuif.imemload[20:16]  = 5'd6;
     cuif.imemload[15:11] = 5'd20;

    #(50) 

     cuif.imemload[5:0] = OR;
     cuif.imemload[25:21] = 5'd2;
     cuif.imemload[20:16]  = 5'd5;
     cuif.imemload[15:11] = 5'd15;


    #(50) 

     cuif.imemload[5:0] = XOR;
     cuif.imemload[25:21] = 5'd9;
     cuif.imemload[20:16]  = 5'd10;
     cuif.imemload[15:11] = 5'd14;


    #(50) 

     cuif.imemload[5:0] = NOR;
     cuif.imemload[25:21] = 5'd7;
     cuif.imemload[20:16]  = 5'd8;
     cuif.imemload[15:11] = 5'd13;


    #(50) 

     cuif.imemload[5:0] = SLT;
     cuif.imemload[25:21] = 5'd3;
     cuif.imemload[20:16]  = 5'd4;
     cuif.imemload[15:11] = 5'd6;



    #(50) 

     cuif.imemload[5:0] = SLTU;
     cuif.imemload[25:21] = 5'd1;
     cuif.imemload[20:16]  = 5'd2;
     cuif.imemload[15:11] = 5'd16;



    #(50) 

     cuif.imemload[5:0] = SRLV;
     cuif.imemload[25:21] = 5'd2;
     cuif.imemload[20:16]  = 5'd19;
     cuif.imemload[15:11] = 5'd12;

    #(50) 

     cuif.imemload[5:0] = SLLV;
     cuif.imemload[25:21] = 5'd3;
     cuif.imemload[20:16]  = 5'd17;
     cuif.imemload[15:11] = 5'd12;

    #(50) 

     cuif.imemload[5:0] = JR;
     cuif.imemload[25:21] = 5'd25;
     cuif.imemload[20:16]  = 5'd22;
     cuif.imemload[15:11] = 5'd13;


     #(50)
        cuif.imemload[31:26] = J;

        #(50)
        cuif.imemload[31:26] = JAL;
        cuif.imemload[25:0] = 26'hfb00be;


     #(50)
     cuif.imemload[31:26] = BEQ;
      cuif.imemload[25:21] = 5'd25;
     cuif.imemload[20:16]  = 5'd22;
     cuif.imemload[15:0] = 16'd5;


        #(50)
        cuif.imemload[31:26] = BNE;
        cuif.imemload[25:21] = 5'd25;
        cuif.imemload[20:16]  = 5'd23;
        cuif.imemload[15:0] = 16'd6;


     #(50)
     cuif.imemload[31:26] = ADDI;
     cuif.imemload[25:21] = 5'd25;
     cuif.imemload[20:16]  = 5'd22;
     cuif.imemload[15:0] = 16'd5;


     #(50)
     cuif.imemload[31:26] = LUI;
     cuif.imemload[25:21] = 5'd20;
     cuif.imemload[20:16]  = 5'd26;
     cuif.imemload[15:0] = 16'd5;


        #(50)
        cuif.imemload[31:26] = XORI;
        cuif.imemload[25:21] = 5'd19;
        cuif.imemload[20:16]  = 5'd2;
        cuif.imemload[15:0] = 16'd5;


     #(50)
     cuif.imemload[31:26] = SLTI;
     cuif.imemload[25:21] = 5'd5;
            cuif.imemload[20:16]  = 5'd6;
        cuif.imemload[15:0] = 16'd5;


     #(50)
     cuif.imemload[31:26] = SLTIU;
     cuif.imemload[25:21] = 5'd25;
         cuif.imemload[20:16]  = 5'd22;
     cuif.imemload[15:0] = 16'd5;


     #(50)
        cuif.imemload[31:26] = ORI;
        cuif.imemload[25:21] = 5'd25;
        cuif.imemload[20:16]  = 5'd0;
        cuif.imemload[15:0] = 16'd5;

     #(50)
     cuif.imemload[31:26] = ADDIU;
      cuif.imemload[25:21] = 5'd25;
     cuif.imemload[20:16]  = 5'd22;
     cuif.imemload[15:0] = 16'd5;


     #(50)
     cuif.imemload[31:26] = LW;
     cuif.imemload[25:21] = 5'd3;
     cuif.imemload[20:16]  = 5'd2;
        cuif.imemload[15:0] = 16'd10;

     #(50)
     cuif.imemload[31:26] = SW;
     cuif.imemload[25:21] = 5'd8;
     cuif.imemload[20:16]  = 5'd10;
     cuif.imemload[15:0] = 16'd2;

        #(50)
        cuif.imemload[31:26] = ANDI;
        cuif.imemload[25:21] = 5'd25;
        cuif.imemload[20:16]  = 5'd22;
        cuif.imemload[15:0] = 16'd5;

        #(50)
        cuif.imemload[31:26] =  HALT;
        cuif.imemload[25:21] = 5'd25;
        cuif.imemload[20:16]  = 5'd22;
        cuif.imemload[15:0] = 16'd5;

     #(100);
    end
endprogram