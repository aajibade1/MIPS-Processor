
`include "types_pkg.vh"

module test
import types_pkg::*;
//import types_pkg::my_t;
(
  input logic CLK, nRST, down,
  output my_t value
  //output logic [31:0] value
);
  //import types_pkg::my_t;
  my_t nvalue;

  always_ff @(posedge CLK or negedge nRST)
  begin
    if (!nRST)
    begin
      value <= '0;
    end
    else
    begin
      value <= nvalue;
    end
  end

  assign nvalue = (down) ? value - 2 : value + 2;
endmodule
