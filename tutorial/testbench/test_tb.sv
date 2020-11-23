`include "types_pkg.vh"

// mapped timing needs this. 1ns is too fast
`timescale 1 ns / 1 ns

module test_tb;

  import types_pkg::my_t;
  parameter PERIOD = 10;

  logic CLK = 1, nRST, down;
  my_t count;
  // clock
  always #(PERIOD/2) CLK++;

  test DUT(
    .CLK,
    .nRST,
    .down,
    .value (count)
  );

  simple #(.PERIOD (PERIOD)) PROG(
    .CLK,
    .nRST,
    .count,
    .down
  );
endmodule

program simple (
  input logic CLK,
  input types_pkg::my_t count,
  output logic nRST, down
);
  parameter PERIOD = 10;
  initial begin
    $monitor("@%00g CLK = %b nRST = %b dir = %b count = %0d",
    $time, CLK, nRST, down, count);
    down = 0;
    nRST = 0;
    #(PERIOD)
    nRST = 1;
    wait (count == 10);
    down = 1;
    wait (count == 0);
    $finish;
  end
endprogram
