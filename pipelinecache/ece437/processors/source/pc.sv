`include "pc_if.vh"
`include "cpu_types_pkg.vh"
`include "hazard_unit_if.vh"

module pc #(PC_INIT = 0)
(
    input CLK, nRST,
    pc_if.pc pif,
    hazard_unit_if huif
);
    import cpu_types_pkg::*;
    logic [25:0] temp;

    always_ff @ (posedge CLK, negedge nRST)
    begin
        if (nRST == 1'b0)
        begin
            pif.PCOut <= PC_INIT;
            pif.npc_r <= 32'd4;
        end
        else begin
            pif.PCOut <= pif.pcDst;
            pif.npc_r <= pif.pcDst + 4;
        end
    end

    always_comb begin
        temp = '0;
        //pif.npc_r = pif.PCOut + 32'd4;
        if (pif.PCSrc == 1'b0) begin
            if (huif.flush) pif.nPCOut = pif.npc; 
            else pif.nPCOut = pif.PCOut + 32'd4;
        end
        else begin
            if (pif.jtype == 1'b1) begin
                if (pif.immtype == 0) begin
                    temp = (pif.immAddr << 2) + pif.npc;
                    pif.nPCOut = {16'b0,temp[15:0]};
                end
                else pif.nPCOut = {pif.npc[31:28], pif.immAddr[25:0], 2'b00};
            end 
            else pif.nPCOut = pif.aluAddr;
        end

        if (pif.halttype && ~huif.dstall) pif.pcDst = pif.nPCOut;
        else pif.pcDst = pif.PCOut;
    end

endmodule