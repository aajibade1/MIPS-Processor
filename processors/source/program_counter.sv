`include "program_counter_if.vh"
`include "cpu_types_pkg.vh"



module program_counter (
    input logic CLK,
    input logic nRST,
    program_counter_if.pcm pcif
);

import cpu_types_pkg::*;

always_ff @ (posedge CLK, negedge nRST) begin
    if(nRST == 1'b0) begin
        pcif.pc <= '0;
    end
    else begin
        if(pcif.PCen == 1'b1) begin
            pcif.pc <= pcif.cpc;
        end
    end
end

always_comb begin
    pcif.npc = pcif.pc + 4;
end
endmodule