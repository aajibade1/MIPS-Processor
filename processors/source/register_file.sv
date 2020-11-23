//interface
`include "register_file_if.vh"
`include "cpu_types_pkg.vh"

module register_file (
    input logic CLK,
    input logic nRST,
    register_file_if.rf rfif
);

import cpu_types_pkg::*;
word_t regs[31:0];

always_comb begin
  rfif.rdat2 = regs[rfif.rsel2];
  rfif.rdat1 = regs[rfif.rsel1];
end

always_ff @(posedge CLK, negedge nRST) begin
  if(!nRST) begin
    regs <= '{default:'0};
  end
  else begin
    if (rfif.WEN && rfif.wsel) begin
      regs[rfif.wsel] <= rfif.wdat;
    end
  end
end
endmodule
