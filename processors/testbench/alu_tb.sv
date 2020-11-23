// mapped needs this
`include "alu_if.vh"
`include "cpu_types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

  import cpu_types_pkg::*;
module alu_tb;

  

  parameter PERIOD = 10;

  logic CLK = 0, nRST;

  // clock
  always #(PERIOD/2) CLK++;

  // interface
  alu_if aluinf ();
  // test program
  test PROG (aluinf, CLK);
  // DUT
`ifndef MAPPED
  alu DUT(aluinf);
`else
  alu DUT(
    .\aluinf.PORTA (aluinf.PORTA),
    .\aluinf.PORTB (aluinf.PORTB),
    .\aluinf.ALUOP (aluinf.ALUOP),
    .\aluinf.ZERO (aluinf.ZERO),
    .\aluinf.OVF (aluinf.OVF),
    .\aluinf.NEG (aluinf.NEG),
    .\aluinf.OUTPORT (aluinf.OUTPORT)
  );
`endif
endmodule

program test(alu_if.tb tbinf, input logic CLK);

  //test bench debug signals
  integer tb_test_num;
  string tb_test_case;

  initial begin
    tb_test_num = 0;
    tb_test_case = "TB init";  
    tbinf.PORTA = 32'h0;
    tbinf.PORTB = 32'h0;
    tbinf.OVF = '0;
    tbinf.NEG = '0;
    tbinf.ZERO = '0;

    #0.1 

/***************************************
    // Test 1 - ALU ADD OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "ADDITION";
    tbinf.PORTA = 32'hFFFFFFFF;
    tbinf.PORTB = 32'hFFFFFFFF;
    tbinf.ALUOP = ALU_ADD;

    #(10);

/***************************************
    // Test 13 - ALU ADD OP OVERFLOW
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "ADDITON OVEFLOW";
    tbinf.PORTA = 32'h80000001;
    tbinf.PORTB = 32'h80000001;
    tbinf.ALUOP = ALU_ADD;

    #(10);

/***************************************
    // Test 2 - ALU SUB OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SUBTRACTION";
    tbinf.PORTA = 32'hFFFFFFFF;
    tbinf.PORTB = 32'hFFFFFFFF;
    tbinf.ALUOP = ALU_SUB;

    #(10);

/***************************************
    // Test 14 - ALU SUB OP OVERFLOW
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SUBTRACTION OVEFLOW";
    tbinf.PORTA = 32'h7FFFFFFF;
    tbinf.PORTB = 32'hFFFFFFFF;
    tbinf.ALUOP = ALU_SUB;

    #(10);

/***************************************
    // Test 3 - ALU AND OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "BITWISE AND";
    tbinf.PORTA = 32'h55555555;
    tbinf.PORTB = 32'hAAAAAAAA;
    tbinf.ALUOP = ALU_AND;

    #(10);

/***************************************
    // Test 4 - ALU OR OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "BITWISE OR";
    tbinf.PORTA = 32'hFFFF0000;
    tbinf.PORTB = 32'hAAAA5050;
    tbinf.ALUOP = ALU_OR;

    #(10);

/***************************************
    // Test 5 - ALU NOR OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "BITWISE NOR";
    tbinf.PORTA = 32'hFFFF0000;
    tbinf.PORTB = 32'hAAAA5050;
    tbinf.ALUOP = ALU_NOR;

    #(10);

/***************************************
    // Test 6 - ALU XOR OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "BITWISE XOR";
    tbinf.PORTA = 32'hF0F0F0F0;
    tbinf.PORTB = 32'hAAAA5050;
    tbinf.ALUOP = ALU_XOR;

    #(10);

/***************************************
    // Test 7 - ALU SLL OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "LOGICAL LEFT SHIFT";
    tbinf.PORTA = 32'hA0000010;
    tbinf.PORTB = 32'd3;
    tbinf.ALUOP = ALU_SLL;

    #(10);

/***************************************
    // Test 8 - ALU SRL OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "LOGICAL RIGHT SHIFT";
    tbinf.PORTA = 32'hA0000010;
    tbinf.PORTB = 32'd3;
    tbinf.ALUOP = ALU_SRL;

    #(10);

/***************************************
    // Test 9 - ALU SLT OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SET LESS THAN";
    tbinf.PORTA = 32'hFFFFFFFF;
    tbinf.PORTB = 32'hFFFFFFFA;
    tbinf.ALUOP = ALU_SLT;

    #(10);

/***************************************
    // Test 10 - ALU SLT OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SET LESS THAN OPPOSITE";
    tbinf.PORTA = 32'h00000001;
    tbinf.PORTB = 32'h00000003;
    tbinf.ALUOP = ALU_SLT;

    #(10);

/***************************************
    // Test 11 - ALU SLTU OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SET LESS THAN UNSIGNED";
    tbinf.PORTA = 32'hFFFFFFFF;
    tbinf.PORTB = 32'hAFFFFFFE;
    tbinf.ALUOP = ALU_SLTU;

    #(10);

/***************************************
    // Test 12 - ALU SLTU OP
***************************************/
    @(posedge CLK)
    tb_test_num += 1;
    tb_test_case = "SET LESS THAN UNSIGNED OPPOSITE";
    tbinf.PORTA = 32'hFFFFFFFE;
    tbinf.PORTB = 32'hAFFFFFFE;
    tbinf.ALUOP = ALU_SLTU;

    #(10);
  end


endprogram