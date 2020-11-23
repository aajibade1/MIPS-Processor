//interface
`include "request_unit_if.vh"
`include "cpu_types_pkg.vh"

module request_unit (
    input logic CLK,
    input logic nRST,
    request_unit_if.ru ruif
);

import cpu_types_pkg::*;

always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
      ruif.dmemREN <= '0;
      ruif.dmemWEN <= '0;
  end
  else if (ruif.dhit == 1'b1) begin
      ruif.dmemREN <= '0;
      ruif.dmemWEN <= '0;
  end
  else if (ruif.ihit == 1'b1) begin
    ruif.dmemWEN <= ruif.dWEN;
    ruif.dmemREN <= ruif.dREN;
  end
end
endmodule